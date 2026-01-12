import 'package:drift/drift.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:park_note/core/database/database.dart' as drift_db;
import 'package:park_note/features/auth/auth_controller.dart';
import 'package:park_note/features/parking/parking_spot_model.dart';
import 'package:park_note/shared/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:url_launcher/url_launcher.dart';

part 'map_controller.g.dart';

@riverpod
class MapController extends _$MapController {
  final Location _location = Location();

  @override
  Future<List<ParkingSpot>> build() async {

    ref.watch(authControllerProvider);


    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return [];
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return [];
      }
    }

    final db = ref.read(databaseProvider);
    

    final query = db.select(db.parkingSpots).join([
      innerJoin(db.parkingLocations, db.parkingLocations.parkingSpotId.equalsExp(db.parkingSpots.id)),
    ]);
    

    
    final rows = await query.get();
    
    List<ParkingSpot> results = [];
    
    for (final row in rows) {
      final spot = row.readTable(db.parkingSpots);
      final location = row.readTable(db.parkingLocations);
      

      final obsQuery = (db.select(db.observations)
        ..where((tbl) => tbl.parkingSpotId.equals(spot.id))
        ..orderBy([(t) => OrderingTerm.desc(t.observedAt)])
        ..limit(1));
      final obs = await obsQuery.getSingleOrNull();


      final photoQuery = (db.select(db.parkingPhotos)
        ..where((tbl) => tbl.parkingSpotId.equals(spot.id))
        ..orderBy([(t) => OrderingTerm.desc(t.takenAt)])
        ..limit(1));
      final photo = await photoQuery.getSingleOrNull();
      

      final reportQuery = (db.select(db.reports)
        ..where((tbl) => tbl.parkingSpotId.equals(spot.id))
        ..orderBy([(t) => OrderingTerm.desc(t.reportedAt)])
        ..limit(1));
      final report = await reportQuery.getSingleOrNull();

      ParkingStatus statusEnum = ParkingStatus.unknown;
      if (obs != null) {

        if (obs.statusId == 1) statusEnum = ParkingStatus.available;
        if (obs.statusId == 2) statusEnum = ParkingStatus.occupied;
      }

      results.add(ParkingSpot(
        id: spot.id.toString(),
        location: LatLng(location.latitude, location.longitude),
        status: statusEnum,
        photoPath: photo?.photoPath,
        notes: report?.description,
        timestamp: obs?.observedAt ?? spot.createdAt,
        userId: spot.userId,
      ));
    }
    
    return results;
  }

  Future<void> addSpot(LatLng location, ParkingStatus status, {String? photoPath, String? notes}) async {
    final authState = ref.read(authControllerProvider);
    final user = authState.value;
    if (user == null) throw Exception('User not logged in');

    final db = ref.read(databaseProvider);
    
    await db.transaction(() async {
      // 1. Create Spot
      final spotId = await db.into(db.parkingSpots).insert(drift_db.ParkingSpotsCompanion.insert(
        name: 'Spot at ${DateTime.now()}',
        vehicleTypeId: 1, // Car default
        userId: Value(user.id),
      ));

      // 2. Location
      await db.into(db.parkingLocations).insert(drift_db.ParkingLocationsCompanion.insert(
        parkingSpotId: spotId,
        latitude: location.latitude,
        longitude: location.longitude,
      ));

      // 3. Observation
      int statusId = 1; // Available
      if (status == ParkingStatus.occupied) statusId = 2; // Occupied
      
      await db.into(db.observations).insert(drift_db.ObservationsCompanion.insert(
        userId: user.id, // CurrentUser
        parkingSpotId: spotId,
        statusId: statusId,
        typeId: 1, // Manual
      ));

      // 4. Photo
      if (photoPath != null) {
        await db.into(db.parkingPhotos).insert(drift_db.ParkingPhotosCompanion.insert(
          parkingSpotId: spotId,
          photoPath: photoPath,
        ));
      }
      
      // 5. Report (Notes)
      if (notes != null && notes.isNotEmpty) {
        await db.into(db.reports).insert(drift_db.ReportsCompanion.insert(
          userId: user.id,
          parkingSpotId: spotId,
          description: notes,
        ));
      }
    });
    
    // Refresh list
    ref.invalidateSelf();
  }

  Future<void> searchSpots(String query) async {
    if (query.isEmpty) {
      ref.invalidateSelf(); // Reset to all spots
      return;
    }

    final db = ref.read(databaseProvider);
    state = const AsyncValue.loading();
    
    final authState = ref.read(authControllerProvider);
    final user = authState.value;
    if (user == null) return;

    try {

      final spots = await db.customSelect(
        'SELECT * FROM parking_spots '
        'WHERE name LIKE ? OR id IN ('
        '  SELECT parking_spot_id FROM reports WHERE description LIKE ?'
        ')',
        variables: [
          Variable.withString('%$query%'),
          Variable.withString('%$query%'),
        ],
      ).get();


      ref.invalidateSelf();
      await future;
      final allSpots = state.value ?? [];
      
      final filtered = allSpots.where((spot) {
        final matchesName = spot.id.contains(query);
        final matchesNotes = spot.notes?.toLowerCase().contains(query.toLowerCase()) ?? false;
        return matchesName || matchesNotes;
      }).toList();
      
      state = AsyncValue.data(filtered);
      
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> launchMapsUrl(double lat, double lng) async {
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Harita açılamadı';
    }
  }

  Future<LatLng?> getUserLocation() async {
    final locationData = await _location.getLocation();
    if (locationData.latitude != null && locationData.longitude != null) {
      return LatLng(locationData.latitude!, locationData.longitude!);
    }
    return null;
  }
}
