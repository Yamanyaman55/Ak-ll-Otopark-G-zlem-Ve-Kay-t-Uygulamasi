import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/auth/auth_controller.dart';
import 'package:park_note/features/map/map_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authControllerProvider);
    final spotsAsync = ref.watch(mapControllerProvider);
    final spotsCount = spotsAsync.asData?.value.length ?? 0;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [

          Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF141E30), Color(0xFF243B55)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Profilim',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(LucideIcons.settings, color: Colors.white),
                          onPressed: () => context.push('/settings'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),


                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: AppTheme.primaryBlue,
                            child: Text(
                              userAsync.value?.username.substring(0, 1).toUpperCase() ?? '?',
                              style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userAsync.value?.username ?? 'Ziyaretçi',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              GestureDetector(
                                onTap: () => context.push('/edit-profile'),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Profili Düzenle',
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),


                  Row(
                    children: [
                      Expanded(child: _buildStatCard('Park Sayısı', spotsCount.toString(), LucideIcons.mapPin)),
                      const SizedBox(width: 16),
                      Expanded(child: _buildStatCard('Puanım', '4.8', LucideIcons.star)),
                    ],
                  ),

                  const SizedBox(height: 30),


                  _buildLevelProgress(spotsCount),

                  const SizedBox(height: 30),

                  // Menu Options
                  Column(
                    children: [
                      _buildMenuTile(context, LucideIcons.heart, 'Favorilerim', () => context.push('/saved-spots')),
                      _buildMenuTile(context, LucideIcons.history, 'Geçmiş İşlemler', () => context.push('/history')),
                      _buildMenuTile(context, LucideIcons.bell, 'Bildirimler', () {}),
                      _buildMenuTile(context, LucideIcons.shieldCheck, 'Güvenlik', () {}),
                      _buildMenuTile(context, LucideIcons.helpCircle, 'Yardım', () {}),
                      const SizedBox(height: 20),
                      _buildMenuTile(
                        context, 
                        LucideIcons.logOut, 
                        'Çıkış Yap', 
                        () async {
                          await ref.read(authControllerProvider.notifier).logout();
                          if (context.mounted) context.go('/login');
                        }, 
                        isDestructive: true
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Dark Card
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF10B981), size: 28), // Green Icon
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White Text
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelProgress(int spotsCount) {
    int currentLevel = (spotsCount ~/ 5) + 1;
    double progress = (spotsCount % 5) / 5.0;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                    'SEVİYE $currentLevel',
                    style: const TextStyle(
                      color: AppTheme.secondaryCyan, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 12
                    ),
                   ),
                   const SizedBox(height: 4),
                   const Text(
                    'Usta Kaşif',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                   ),
                 ],
               ),
               Container(
                 padding: const EdgeInsets.all(12),
                 decoration: BoxDecoration(
                   color: AppTheme.secondaryCyan.withValues(alpha: 0.2),
                   shape: BoxShape.circle,
                   border: Border.all(color: AppTheme.secondaryCyan.withValues(alpha: 0.5)),
                 ),
                 child: const Icon(LucideIcons.crown, color: AppTheme.secondaryCyan),
               ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              color: AppTheme.secondaryCyan,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Sonraki seviyeye: ${(5 - (spotsCount % 5))} park',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, IconData icon, String title, VoidCallback onTap, {Color color = const Color(0xFF10B981), bool isDestructive = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B), // Dark Card
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDestructive ? Colors.red.withValues(alpha: 0.1) : color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: isDestructive ? Colors.red : color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: isDestructive ? Colors.red : Colors.white,
                  ),
                ),
              ),
              Icon(LucideIcons.chevronRight, color: Colors.white.withValues(alpha: 0.2), size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
