import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:park_note/shared/providers/database_provider.dart';
import 'package:park_note/core/database/database.dart';

part 'admin_controller.g.dart';

class AdminStats {
  final int totalUsers;
  final int totalSpots;
  final int activeSessions;
  final List<User> recentUsers;
  final List<ParkingSpot> recentSpots;

  AdminStats({
    required this.totalUsers,
    required this.totalSpots,
    required this.activeSessions,
    required this.recentUsers,
    required this.recentSpots,
  });
}

@riverpod
class AdminController extends _$AdminController {
  @override
  Future<AdminStats> build() async {
    return _fetchStats();
  }

  Future<AdminStats> _fetchStats() async {
    final db = ref.read(databaseProvider);
    
    final users = await db.select(db.users).get();
    final spots = await db.select(db.parkingSpots).get();
    final sessions = await db.select(db.parkingSessions).get();
    
    // İstatistikler için gerekirse aktif oturumları filtreleyebiliriz, şimdilik hepsini sayalım
    // Şimdilik tüm istatistikleri sayalım
    
    return AdminStats(
      totalUsers: users.length,
      totalSpots: spots.length,
      activeSessions: sessions.length, // Temelde toplam geçmiş sayısı
      recentUsers: users.take(5).toList(),
      recentSpots: spots.take(5).toList(),
    );
  }

  Future<void> deleteUser(int userId) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.users)..where((t) => t.id.equals(userId))).go();
    ref.invalidateSelf();
  }

  Future<void> deleteSpot(int spotId) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.parkingSpots)..where((t) => t.id.equals(spotId))).go();
    ref.invalidateSelf();
  }
}
