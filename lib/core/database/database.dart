import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Users,
  VehicleTypes,
  ParkingStatus,
  ObservationTypes,
  ParkingSpots,
  ParkingLocations,
  ParkingPhotos,
  Observations,
  Reports,
  Notifications,
  ParkingSessions,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          
          // Seed initial data
          await into(vehicleTypes).insert(VehicleTypesCompanion.insert(typeName: 'Car'));
          await into(vehicleTypes).insert(VehicleTypesCompanion.insert(typeName: 'Motorcycle'));
          
          await into(parkingStatus).insert(ParkingStatusCompanion.insert(statusName: 'Empty', colorHex: '#4CAF50')); // Green
          await into(parkingStatus).insert(ParkingStatusCompanion.insert(statusName: 'Full', colorHex: '#F44336')); // Red
          
          await into(observationTypes).insert(ObservationTypesCompanion.insert(typeName: 'Manual'));
          await into(users).insert(UsersCompanion.insert(username: 'CurrentUser', password: 'password123')); // Simple single user 
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await customStatement('ALTER TABLE users ADD COLUMN password TEXT NOT NULL DEFAULT \'\'');
          }
          if (from < 3) {
            await m.createTable(parkingSessions);
          }
          if (from < 4) {
            await m.addColumn(parkingSessions, parkingSessions.latitude);
            await m.addColumn(parkingSessions, parkingSessions.longitude);
          }
          if (from < 5) {
            await m.addColumn(parkingSpots, parkingSpots.userId);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
