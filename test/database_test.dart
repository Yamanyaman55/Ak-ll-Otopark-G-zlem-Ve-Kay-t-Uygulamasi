import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:park_note/core/database/database.dart';
import 'package:drift/drift.dart' as drift;

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('Database should support 10-table operations', () async {
    // 1. Initial Migration (Seeds vehicle types, status, etc)
    // We trigger a read to force migration
    await db.users.select().get();

    // Verify Seeds
    final vehicles = await db.vehicleTypes.select().get();
    expect(vehicles.length, 2); // Car, Motorcycle
    
    final statuses = await db.parkingStatus.select().get();
    expect(statuses.length, 2); // Empty, Full

    // 2. Add a Parking Spot (Simulate MapController logic)
    final spotId = await db.into(db.parkingSpots).insert(ParkingSpotsCompanion.insert(
      name: 'Test Spot',
      vehicleTypeId: 1,
    ));

    // 3. Add Location
    await db.into(db.parkingLocations).insert(ParkingLocationsCompanion.insert(
      parkingSpotId: spotId,
      latitude: 10.0,
      longitude: 20.0,
    ));

    // 4. Add Observation
    await db.into(db.observations).insert(ObservationsCompanion.insert(
      userId: 1,
      parkingSpotId: spotId,
      statusId: 1, // Empty
      typeId: 1,
    ));

    // 5. Add Photo
    await db.into(db.parkingPhotos).insert(ParkingPhotosCompanion.insert(
      parkingSpotId: spotId,
      photoPath: '/tmp/test.jpg',
    ));
    
    // 6. Add Report (Notes)
    await db.into(db.reports).insert(ReportsCompanion.insert(
      userId: 1,
      parkingSpotId: spotId,
      description: 'Testing 10 tables',
    ));

    // VERIFICATION
    final storedSpot = await (db.select(db.parkingSpots)..where((t) => t.id.equals(spotId))).getSingle();
    expect(storedSpot.name, 'Test Spot');

    final storedLoc = await (db.select(db.parkingLocations)..where((t) => t.parkingSpotId.equals(spotId))).getSingle();
    expect(storedLoc.latitude, 10.0);

    final storedObs = await (db.select(db.observations)..where((t) => t.parkingSpotId.equals(spotId))).getSingle();
    expect(storedObs.statusId, 1);
    
    final storedPhoto = await (db.select(db.parkingPhotos)..where((t) => t.parkingSpotId.equals(spotId))).getSingle();
    expect(storedPhoto.photoPath, '/tmp/test.jpg');
    
    final storedReport = await (db.select(db.reports)..where((t) => t.parkingSpotId.equals(spotId))).getSingle();
    expect(storedReport.description, 'Testing 10 tables');
    
    // Check unused tables to ensure they exist (part of 10 tables)
    final notifs = await db.notifications.select().get();
    expect(notifs.isEmpty, true);
    
    final obsTypes = await db.observationTypes.select().get();
    expect(obsTypes.isNotEmpty, true);
  });
}
