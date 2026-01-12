import 'package:drift/drift.dart';

// 1. Kullanıcılar
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 1, max: 50)();
  TextColumn get password => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Park Oturumları - Kullanıcının park geçmişi
class ParkingSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  DateTimeColumn get entryTime => dateTime()();
  DateTimeColumn get exitTime => dateTime().nullable()();
  RealColumn get fee => real().nullable()();
  RealColumn get latitude => real().nullable()(); // YENİ: Konum Enlem
  RealColumn get longitude => real().nullable()(); // YENİ: Konum Boylam
  TextColumn get photoPath => text().nullable()();
  TextColumn get locationNote => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

// 2. Araç Tipleri
class VehicleTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get typeName => text()(); // örn: Araba, Motosiklet, Kamyon
}

// 3. Park Durumları
class ParkingStatus extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get statusName => text()(); // örn: Boş, Dolu
  TextColumn get colorHex => text()(); // örn: #00FF00
}

// 4. Gözlem Tipleri
class ObservationTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get typeName => text()(); // örn: Görsel, Sensör
}

// 5. Park Yerleri
class ParkingSpots extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get userId => integer().nullable().references(Users, #id)(); // Migrasyon için nullable
  IntColumn get vehicleTypeId => integer().references(VehicleTypes, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 6. Park Konumları
class ParkingLocations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parkingSpotId => integer().references(ParkingSpots, #id)();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get address => text().nullable()();
}

// 7. Park Fotoğrafları
class ParkingPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parkingSpotId => integer().references(ParkingSpots, #id)();
  TextColumn get photoPath => text()();
  DateTimeColumn get takenAt => dateTime().withDefault(currentDateAndTime)();
}

// 8. Gözlemler (Doluluk Bildirimleri)
class Observations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get parkingSpotId => integer().references(ParkingSpots, #id)();
  IntColumn get statusId => integer().references(ParkingStatus, #id)();
  IntColumn get typeId => integer().references(ObservationTypes, #id)();
  DateTimeColumn get observedAt => dateTime().withDefault(currentDateAndTime)();
}

// 9. Raporlar (Hatalı durum bildirimi)
class Reports extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get parkingSpotId => integer().references(ParkingSpots, #id)();
  TextColumn get description => text()();
  DateTimeColumn get reportedAt => dateTime().withDefault(currentDateAndTime)();
}

// 10. Bildirimler
class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get title => text()();
  TextColumn get body => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
}
