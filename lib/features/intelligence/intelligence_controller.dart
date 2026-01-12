import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:park_note/shared/providers/database_provider.dart';
import 'package:drift/drift.dart';
import 'package:park_note/core/database/database.dart';

part 'intelligence_controller.g.dart';

class IntelligenceData {
  final double safetyScore;
  final int totalSpots;
  final int occupiedSpots;
  final double occupancyRate;
  final String weatherCondition;
  final int temperature;

  IntelligenceData({
    required this.safetyScore,
    required this.totalSpots,
    required this.occupiedSpots,
    required this.occupancyRate,
    required this.weatherCondition,
    required this.temperature,
  });
}

@riverpod
class IntelligenceController extends _$IntelligenceController {
  @override
  Future<IntelligenceData> build() async {
    final db = ref.read(databaseProvider);

    // 1. Doluluk Oranı Hesaplama
    // Tüm park yerlerini çek
    final allSpots = await db.select(db.parkingSpots).get();
    final totalSpots = allSpots.length;

    int occupiedCount = 0;
    
    // Her park yeri için son gözlem durumunu kontrol et
    for (final spot in allSpots) {
       final obsQuery = (db.select(db.observations)
        ..where((tbl) => tbl.parkingSpotId.equals(spot.id))
        ..orderBy([(t) => OrderingTerm.desc(t.observedAt)])
        ..limit(1));
       final obs = await obsQuery.getSingleOrNull();
       
       if (obs != null && obs.statusId == 2) { // 2 = Dolu
         occupiedCount++;
       }
    }

    final double occupancyRate = totalSpots == 0 ? 0.0 : (occupiedCount / totalSpots);

    // 2. Güvenlik Puanı Hesaplama
    // Mantık: Daha fazla park kaydı = daha güvenli bölge hissi. Maksimum puan 10.
    // Her başarılı oturum 0.5 puan ekler. Baz puan 5.0.
    final sessions = await db.select(db.parkingSessions).get();
    double safetyScore = 5.0 + (sessions.length * 0.5);
    if (safetyScore > 10.0) safetyScore = 10.0;
    
    // 3. Hava Durumu (Mock)
    // Gerçek uygulamada burada OpenWeatherMap API kullanılmalı.
    const weatherCondition = "Parçalı Bulutlu";
    const temperature = 19;

    return IntelligenceData(
      safetyScore: safetyScore,
      totalSpots: totalSpots,
      occupiedSpots: occupiedCount,
      occupancyRate: occupancyRate,
      weatherCondition: weatherCondition,
      temperature: temperature,
    );
  }
}
