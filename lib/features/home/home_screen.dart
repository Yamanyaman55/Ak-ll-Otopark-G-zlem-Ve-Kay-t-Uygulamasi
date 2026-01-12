import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/auth/auth_controller.dart';
import 'package:park_note/features/parking/parking_session_controller.dart';
import 'package:park_note/features/intelligence/intelligence_controller.dart';
import 'dart:async';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Timer? _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(authControllerProvider);
    final sessionAsync = ref.watch(parkingSessionControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Hero Section
            Container(
              height: 240,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF141E30), Color(0xFF243B55)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreeting(),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userAsync.value?.username ?? 'Misafir',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => context.go('/profile'),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Text(
                              userAsync.value?.username.substring(0, 1).toUpperCase() ?? '?',
                              style: const TextStyle(
                                color: AppTheme.secondaryGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  Consumer(
                    builder: (context, ref, child) {
                      final intelligenceAsync = ref.watch(intelligenceControllerProvider);
                      
                      return intelligenceAsync.when(
                        data: (data) => GestureDetector(
                          onTap: () => context.push('/intelligence'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(LucideIcons.cloudSun, color: Colors.white, size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  '${data.temperature}°C, ${data.weatherCondition}',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12),
                                  height: 16,
                                  width: 1,
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                                 const Icon(LucideIcons.car, color: Colors.white, size: 16),
                                 const SizedBox(width: 8),
                                 Text(
                                  '%${(data.occupancyRate * 100).toInt()} Dolu',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        loading: () => const SizedBox(),
                        error: (e, s) => const SizedBox(),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 2. Main Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    'DURUM',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildLiveStatusCard(context, sessionAsync),

                  const SizedBox(height: 32),


                  const Text(
                    'HIZLI ERİŞİM',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    children: [
                      _buildGridCard(
                        context,
                        title: 'Harita',
                        subtitle: 'Park Yeri Bul',
                        icon: LucideIcons.map,
                        color: AppTheme.primaryBlue,
                        onTap: () => context.go('/map'),
                      ),
                      _buildGridCard(
                        context,
                        title: 'AI Analiz',
                        subtitle: 'Bölgeyi Tara',
                        icon: LucideIcons.brainCircuit,
                        color: AppTheme.secondaryCyan,
                        onTap: () => context.push('/intelligence'),
                      ),
                      _buildGridCard(
                        context,
                        title: 'Kamera',
                        subtitle: 'Park Bildir',
                        icon: LucideIcons.camera,
                        color: AppTheme.accentPink,
                        onTap: () => context.push('/add-spot'),
                      ),
                      _buildGridCard(
                        context,
                        title: 'Geçmiş',
                        subtitle: 'Aktivitelerim',
                        icon: LucideIcons.history,
                        color: AppTheme.secondaryGreen,
                        onTap: () => context.go('/activity'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = _now.hour;
    if (hour < 12) return 'Günaydın';
    if (hour < 18) return 'Tünaydın';
    return 'İyi Akşamlar';
  }

  Widget _buildLiveStatusCard(BuildContext context, AsyncValue<dynamic> sessionAsync) {
    return sessionAsync.when(
      data: (session) {
        final hasActiveSession = session != null;
        
        return GestureDetector(
          onTap: () => context.push('/smart-parking'),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: hasActiveSession 
                    ? [const Color(0xFF047857), const Color(0xFF10B981)] 
                    : [const Color(0xFF1E293B), const Color(0xFF334155)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: (hasActiveSession ? AppTheme.secondaryGreen : Colors.black).withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    hasActiveSession ? LucideIcons.parkingSquare : LucideIcons.search,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasActiveSession ? 'Park Halindesiniz' : 'Park Yeri Arıyor Musun?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        hasActiveSession 
                            ? 'Süreyi ve ücreti görmek için dokunun.' 
                            : 'En yakın boş otoparkları görmek için haritayı açın.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(LucideIcons.chevronRight, color: Colors.white),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => const SizedBox(),
    );
  }

  Widget _buildGridCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
