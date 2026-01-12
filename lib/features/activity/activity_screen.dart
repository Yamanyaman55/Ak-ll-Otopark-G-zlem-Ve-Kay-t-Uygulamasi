import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/map/map_controller.dart';
import 'package:park_note/features/parking/parking_spot_model.dart';
import 'package:intl/date_symbol_data_local.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('tr_TR', null);
  }

  @override
  Widget build(BuildContext context) {
    final spotsAsync = ref.watch(mapControllerProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: const Text(
                'Aktivite Günlüğü',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF141E30), Color(0xFF243B55)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton( 
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(LucideIcons.listFilter, color: Colors.white, size: 20),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
            ],
          ),

          spotsAsync.when(
            data: (spots) {
              if (spots.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LucideIcons.history, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('Henüz bir aktivite yok.', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              }
              
              final sortedSpots = List<ParkingSpot>.from(spots)
                ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final spot = sortedSpots[index];
                      final isLast = index == sortedSpots.length - 1;
                      return _TimelineItem(spot: spot, isLast: isLast);
                    },
                    childCount: sortedSpots.length,
                  ),
                ),
              );
            },
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (err, stack) => SliverFillRemaining(child: Center(child: Text('Hata: $err', style: TextStyle(color: Colors.white)))),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final ParkingSpot spot;
  final bool isLast;

  const _TimelineItem({required this.spot, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getStatusColor(spot.status),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _getStatusColor(spot.status).withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [_getStatusColor(spot.status), Colors.grey[200]!],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if (spot.photoPath != null)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.file(File(spot.photoPath!), fit: BoxFit.cover),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 12,
                                left: 16,
                                child: Text(
                                  DateFormat('HH:mm').format(spot.timestamp),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else 
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: _getStatusColor(spot.status).withOpacity(0.1),
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                         alignment: Alignment.centerLeft,
                         child: Text(
                           DateFormat('HH:mm').format(spot.timestamp),
                           style: TextStyle(
                            color: _getStatusColor(spot.status),
                            fontWeight: FontWeight.bold, 
                            fontSize: 24
                           ),
                         ),
                      ),

                    // Card Body
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(

                                DateFormat('d MMMM yyyy').format(spot.timestamp),
                                style: TextStyle(color: Colors.grey[400], fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(spot.status).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  spot.status == ParkingStatus.available ? 'MÜSAİT' : 'DOLU',
                                  style: TextStyle(
                                    color: _getStatusColor(spot.status),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            spot.notes?.isNotEmpty == true ? spot.notes! : 'Not eklenmemiş.',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (spot.status == ParkingStatus.available)
                            Row(
                              children: [
                                const Icon(LucideIcons.checkCircle, size: 14, color: AppTheme.secondaryGreen),
                                const SizedBox(width: 4),
                                Text('Park edilebilir alan', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ParkingStatus status) {
    switch (status) {
      case ParkingStatus.available:
        return AppTheme.secondaryGreen;
      case ParkingStatus.occupied:
        return AppTheme.errorRed;
      case ParkingStatus.unknown:
        return Colors.grey;
    }
  }
}
