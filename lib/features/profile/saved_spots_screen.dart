import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/auth/auth_controller.dart';
import 'package:park_note/features/map/map_controller.dart';
import 'package:park_note/features/parking/parking_spot_model.dart';

class SavedSpotsScreen extends ConsumerWidget {
  const SavedSpotsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final spotsAsync = ref.watch(mapControllerProvider);
    final authState = ref.watch(authControllerProvider);
    final currentUser = authState.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaydedilenler'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: spotsAsync.when(
        data: (allSpots) {

          final spots = currentUser == null 
              ? <ParkingSpot>[] 
              : allSpots.where((s) => s.userId == currentUser.id).toList();

          if (spots.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.bookmark, size: 60, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Henüz kaydedilmiş yer yok',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: spots.length,
            itemBuilder: (context, index) {
              final spot = spots[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    if (spot.photoPath != null)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.file(
                          File(spot.photoPath!),
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ListTile(
                      title: Text(
                        spot.status == ParkingStatus.available ? 'Müsait Park Yeri' : 'Dolu Park Yeri',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(spot.notes ?? ''),
                      trailing: IconButton(
                        icon: const Icon(LucideIcons.bookmarkMinus, color: AppTheme.errorRed),
                        onPressed: () {

                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Favorilerden kaldırıldı (simülasyon)')));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata: $err')),
      ),
    );
  }
}
