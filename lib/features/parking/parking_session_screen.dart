import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/parking/parking_session_controller.dart';
import 'dart:ui';

class ParkingSessionScreen extends ConsumerStatefulWidget {
  const ParkingSessionScreen({super.key});

  @override
  ConsumerState<ParkingSessionScreen> createState() => _ParkingSessionScreenState();
}

class _ParkingSessionScreenState extends ConsumerState<ParkingSessionScreen> with SingleTickerProviderStateMixin {
  Timer? _timer;
  Duration _duration = Duration.zero;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _startTimer(DateTime entryTime) {
    _timer?.cancel();
    _duration = DateTime.now().difference(entryTime);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _duration = DateTime.now().difference(entryTime);
        });
      }
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "${twoDigits(d.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final sessionAsync = ref.watch(parkingSessionControllerProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: Stack(
        children: [

          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryPurple.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(color: AppTheme.primaryPurple.withOpacity(0.3), blurRadius: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.secondaryCyan.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(color: AppTheme.secondaryCyan.withOpacity(0.3), blurRadius: 100),
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: sessionAsync.when(
              data: (session) {
                if (session != null && _timer == null) {
                  _startTimer(session.entryTime);
                } else if (session == null) {
                  _timer?.cancel();
                  _duration = Duration.zero;
                }

                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => context.go('/map'),
                            icon: const Icon(LucideIcons.arrowLeft, color: Colors.black87),
                          ),
                          Text(
                            'Akıllı Otopark',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 48), // Balance
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Main Card (Glassmorphism)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: AppTheme.glassBoxDecoration(
                          color: Colors.white,
                          opacity: 0.7,
                        ),
                        child: Column(
                          children: [
                            ScaleTransition(
                              scale: Tween(begin: 1.0, end: 1.1).animate(_pulseController),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: session != null 
                                      ? AppTheme.primaryBlue.withOpacity(0.1) 
                                      : Colors.grey.withOpacity(0.1),
                                  border: Border.all(
                                    color: session != null 
                                        ? AppTheme.primaryBlue 
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  LucideIcons.parkingSquare,
                                  size: 48,
                                  color: session != null ? AppTheme.primaryBlue : Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            // Radar Button (Only if active and has location)
                            if (session != null && session.latitude != null && session.longitude != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    context.go('/smart-parking/radar', extra: {
                                      'lat': session.latitude!,
                                      'lng': session.longitude!,
                                    });
                                  },
                                  icon: const Icon(LucideIcons.radar, size: 20),
                                  label: const Text('ARACIMI BUL (RADAR)'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    foregroundColor: AppTheme.secondaryGreen,
                                    elevation: 5,
                                    shadowColor: AppTheme.secondaryGreen.withOpacity(0.5),
                                    side: const BorderSide(color: AppTheme.secondaryGreen),
                                  ),
                                ),
                              ),

                            Text(
                              session != null ? 'Park Halindesiniz' : 'Park Oturumu Başlat',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (session != null) ...[
                              Text(
                                _formatDuration(_duration),
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Giriş: ${session.entryTime.hour}:${session.entryTime.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ] else ...[
                              const Text(
                                'Aracınızı park ettikten sonra süreyi başlatın.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ],
                        ),
                      ),
                      
                      const Spacer(),

                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              if (session == null) {
                                await ref.read(parkingSessionControllerProvider.notifier).startSession(note: "Giriş Katı");
                              } else {
                                final fee = await ref.read(parkingSessionControllerProvider.notifier).endSession();
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: AppTheme.glassBoxDecoration(
                                          color: Colors.white,
                                          opacity: 0.9,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: AppTheme.secondaryGreen.withOpacity(0.1),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(LucideIcons.checkCircle, color: AppTheme.secondaryGreen, size: 48),
                                            ),
                                            const SizedBox(height: 24),
                                            const Text(
                                              'Park Tamamlandı',
                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 12),
                                            const Text('Toplam Tutar', style: TextStyle(color: Colors.grey)),
                                            Text(
                                              '₺${fee.toStringAsFixed(2)}',
                                              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black87),
                                            ),
                                            const SizedBox(height: 32),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () => context.pop(), // Pop dialog
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: AppTheme.primaryBlue,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                ),
                                                child: const Text('Tamam', style: TextStyle(color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Hata: $e')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: session != null ? AppTheme.errorRed : AppTheme.primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            session != null ? 'Parkı Bitir ve Öde' : 'Parkı Başlat',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
