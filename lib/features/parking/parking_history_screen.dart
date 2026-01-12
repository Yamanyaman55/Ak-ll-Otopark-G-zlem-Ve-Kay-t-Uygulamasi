import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/auth/auth_controller.dart'; // Import Auth
import 'package:park_note/core/database/database.dart';
import 'package:park_note/shared/providers/database_provider.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:go_router/go_router.dart';

class ParkingHistoryScreen extends ConsumerWidget {
  const ParkingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    final authState = ref.watch(authControllerProvider);
    final user = authState.value;

    if (user == null) return const Scaffold(body: Center(child: Text("Lütfen giriş yapın")));

    return Scaffold(

      appBar: AppBar(
        title: const Text('Otopark Geçmişi'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<List<ParkingSession>>(
        stream: (db.select(db.parkingSessions)
              ..orderBy([(t) => OrderingTerm(expression: t.entryTime, mode: OrderingMode.desc)])
              ..where((t) => t.isActive.equals(false))
              ..where((t) => t.userId.equals(user.id))) // Filter by user
            .watch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
          }
          final sessions = snapshot.data ?? [];

          if (sessions.isEmpty) {
            return const Center(child: Text('Henüz geçmiş park kaydı yok.', style: TextStyle(color: Colors.white70)));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: AppTheme.glassBoxDecoration(
                  color: const Color(0xFF1E293B), // Dark surface color
                  opacity: 0.6,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryGreen.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(LucideIcons.parkingCircle, color: AppTheme.secondaryGreen),
                  ),
                  title: Text(
                    'Park İşlemi #${session.id}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        'Giriş: ${session.entryTime.toString().substring(0, 16)}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      if (session.exitTime != null)
                        Text(
                          'Çıkış: ${session.exitTime.toString().substring(0, 16)}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₺${session.fee?.toStringAsFixed(2) ?? "0.00"}',
                        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: AppTheme.secondaryGreen),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Tamamlandı',
                          style: TextStyle(fontSize: 10, color: AppTheme.secondaryGreen, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
