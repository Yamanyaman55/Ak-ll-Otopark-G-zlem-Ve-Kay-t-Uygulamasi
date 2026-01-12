import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/admin/admin_controller.dart';
import 'package:park_note/core/database/database.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adminState = ref.watch(adminControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Admin & Analytics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut, color: AppTheme.errorRed),
            onPressed: () => context.go('/login'),
          ),
        ],
      ),
      body: adminState.when(
        data: (stats) => SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Charts Section
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    // Activity Line Chart
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Haftalık Aktivite', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            Expanded(
                              child: LineChart(
                                LineChartData(
                                  gridData: const FlGridData(show: false),
                                  titlesData: const FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  minX: 0,
                                  maxX: 6,
                                  minY: 0,
                                  maxY: 10,
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: const [
                                        FlSpot(0, 3),
                                        FlSpot(1, 1),
                                        FlSpot(2, 4),
                                        FlSpot(3, 2),
                                        FlSpot(4, 5),
                                        FlSpot(5, 3),
                                        FlSpot(6, 4),
                                      ],
                                      isCurved: true,
                                      color: AppTheme.secondaryCyan,
                                      barWidth: 3,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: AppTheme.secondaryCyan.withValues(alpha: 0.2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Capacity Pie Chart
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                        ),
                        child: Column(
                          children: [
                            const Text('Doluluk', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            SizedBox(
                              height: 100,
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 30,
                                  sections: [
                                    PieChartSectionData(
                                      color: AppTheme.secondaryGreen,
                                      value: (stats.totalSpots == 0 ? 1 : (stats.totalSpots - 2)).toDouble().clamp(0, 100), // Mock occupied
                                      title: '',
                                      radius: 12,
                                    ),
                                    PieChartSectionData(
                                      color: AppTheme.primaryBlue.withOpacity(0.2),
                                      value: 2,
                                      title: '',
                                      radius: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text('${stats.totalSpots} Toplam', style: const TextStyle(color: Colors.grey, fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 2. Summary Cards (Compact)
              Row(
                children: [
                  Expanded(child: _buildStatCard('Kullanıcı', stats.totalUsers.toString(), LucideIcons.users, AppTheme.primaryBlue)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildStatCard('Park Yeri', stats.totalSpots.toString(), LucideIcons.mapPin, AppTheme.secondaryCyan)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildStatCard('Oturum', stats.activeSessions.toString(), LucideIcons.history, AppTheme.secondaryGreen)),
                ],
              ),
              
              const SizedBox(height: 32),
              
              const Text('Kullanıcı Yönetimi', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 16),
              _buildUserList(context, ref, stats.recentUsers),

              const SizedBox(height: 32),

              const Text('Park Yeri Yönetimi', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 16),
              _buildSpotList(context, ref, stats.recentSpots),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata: $err', style: const TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildUserList(BuildContext context, WidgetRef ref, List<User> users) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: users.length,
        separatorBuilder: (c, i) => Divider(color: Colors.white.withOpacity(0.05), height: 1),
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.primaryBlue.withOpacity(0.2),
              child: Text(user.username[0].toUpperCase(), style: const TextStyle(color: AppTheme.primaryBlue)),
            ),
            title: Text(user.username, style: const TextStyle(color: Colors.white)),
            subtitle: Text('ID: ${user.id}', style: TextStyle(color: Colors.white.withOpacity(0.5))),
            trailing: IconButton(
              icon: const Icon(LucideIcons.trash2, color: AppTheme.errorRed, size: 18),
              onPressed: () => _confirmDelete(context, () => ref.read(adminControllerProvider.notifier).deleteUser(user.id)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSpotList(BuildContext context, WidgetRef ref, List<ParkingSpot> spots) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: spots.length,
        separatorBuilder: (c, i) => Divider(color: Colors.white.withOpacity(0.05), height: 1),
        itemBuilder: (context, index) {
          final spot = spots[index];
          return ListTile(
            leading:  Icon(LucideIcons.mapPin, color: AppTheme.secondaryCyan.withOpacity(0.7)),
            title: Text(spot.name, style: const TextStyle(color: Colors.white)),
            subtitle: Text('Sahip ID: ${spot.userId ?? "Bilinmiyor"}', style: TextStyle(color: Colors.white.withOpacity(0.5))),
            trailing: IconButton(
              icon: const Icon(LucideIcons.trash2, color: AppTheme.errorRed, size: 18),
              onPressed: () => _confirmDelete(context, () => ref.read(adminControllerProvider.notifier).deleteSpot(spot.id)),
            ),
          );
        },
      ),
    );
  }

  void _confirmDelete(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text('Sil?', style: TextStyle(color: Colors.white)),
        content: const Text('Bu işlem geri alınamaz.', style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('İptal')),
          TextButton(
            onPressed: () {
              onConfirm();
              context.pop();
            },
            child: const Text('Sil', style: TextStyle(color: AppTheme.errorRed)),
          ),
        ],
      ),
    );
  }
}
