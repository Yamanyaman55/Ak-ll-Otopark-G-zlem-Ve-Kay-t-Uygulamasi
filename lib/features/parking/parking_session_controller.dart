
import 'package:drift/drift.dart';
import 'package:park_note/core/database/database.dart';
import 'package:park_note/features/auth/auth_controller.dart';
import 'package:park_note/features/map/map_controller.dart';
import 'package:park_note/shared/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'parking_session_controller.g.dart';

@riverpod
class ParkingSessionController extends _$ParkingSessionController {
  @override
  Stream<dynamic> build() {
    final authState = ref.watch(authControllerProvider);
    final user = authState.value;

    if (user == null) return Stream.value(null);

    final db = ref.read(databaseProvider);
    // Aktif oturumu izle
    return (db.select(db.parkingSessions)
          ..where((t) => t.isActive.equals(true))
          ..where((t) => t.userId.equals(user.id)) // Kullanıcıya göre filtrele
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<void> startSession({String? note}) async {
    final db = ref.read(databaseProvider);
    
    // Halihazırda giriş yapılmış mı kontrol et
    final active = await future;
    if (active != null) throw Exception('Zaten aktif bir park oturumu var!');

    final user = await ref.read(authControllerProvider.future);
    if (user == null) throw Exception('Oturum açmalısınız');

    // MapController'dan güncel konumu al
    final location = await ref.read(mapControllerProvider.notifier).getUserLocation();

    await db.into(db.parkingSessions).insert(ParkingSessionsCompanion.insert(
      userId: user.id,
      entryTime: DateTime.now(),
      locationNote: Value(note),
      latitude: Value(location?.latitude),
      longitude: Value(location?.longitude),
    ));
  }

  Future<double> endSession() async {
    final db = ref.read(databaseProvider);
    final active = await future;
    
    if (active == null) return 0.0;

    final exitTime = DateTime.now();
    final duration = exitTime.difference(active.entryTime);
    
    // Ücret hesaplama mantığı: İlk 1 saat 20 TL, sonraki her saat +10 TL
    double fee = 20.0;
    if (duration.inMinutes > 60) {
      final additionalHours = (duration.inMinutes - 60) / 60;
      fee += additionalHours.ceil() * 10;
    }

    await (db.update(db.parkingSessions)..where((t) => t.id.equals(active.id))).write(
      ParkingSessionsCompanion(
        exitTime: Value(exitTime),
        fee: Value(fee),
        isActive: const Value(false),
      ),
    );
    
    return fee;
  }
}
