import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/intelligence/intelligence_controller.dart';

class IntelligenceScreen extends ConsumerStatefulWidget {
  const IntelligenceScreen({super.key});

  @override
  ConsumerState<IntelligenceScreen> createState() => _IntelligenceScreenState();
}

class _IntelligenceScreenState extends ConsumerState<IntelligenceScreen> with TickerProviderStateMixin {
  late AnimationController _scanController;
  // gaugeController removed, will animate safely based on data load

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final intelligenceAsync = ref.watch(intelligenceControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Cyberpunk Grid Background
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
                      ),
                      const Text(
                        'PARKNOTE INTELLIGENCE',
                        style: TextStyle(
                          color: AppTheme.primaryBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                Expanded(
                  child: intelligenceAsync.when(
                    data: (data) {
                      _scanController.stop(); // Stop scanning when data is ready
                      return _buildDashboard(data);
                    },
                    loading: () => _buildScanner(),
                    error: (err, stack) => Center(child: Text('Veri Hatası: $err', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanner() {
    // Keep scanning animation running if not disposed
    if (!_scanController.isAnimating) _scanController.repeat();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Rotating Rings
              RotationTransition(
                turns: _scanController,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.primaryBlue.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                ),
              ),
               RotationTransition(
                turns: ReverseAnimation(_scanController),
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.secondaryCyan.withOpacity(0.5),
                      width: 4,
                      style: BorderStyle.none, // Dotted effect trick could be here, keeping simple
                    ),
                  ),
                  child: CircularProgressIndicator(
                    color: AppTheme.secondaryCyan,
                    strokeWidth: 2,
                  ),
                ),
              ),
              const Icon(LucideIcons.brainCircuit, size: 64, color: Colors.white),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'BÖLGE ANALİZ EDİLİYOR...',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 4,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Güvenlik • Hava • Doluluk',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard(IntelligenceData data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Safety Score Section
          _buildSectionTitle('GÜVENLİK SKORU', LucideIcons.shieldCheck),
          const SizedBox(height: 16),
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: data.safetyScore),
              duration: const Duration(seconds: 2),
              curve: Curves.easeOutExpo,
              builder: (context, value, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        value: value / 10,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[900],
                        color: _getSafetyColor(value),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          value.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: _getSafetyColor(value),
                          ),
                        ),
                        const Text(
                          '/ 10',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              data.safetyScore > 7 ? 'Bu bölge park için oldukça güvenli.' :
              data.safetyScore > 4 ? 'Orta seviye güvenlik.' : 'Dikkatli olun.',
              style: const TextStyle(color: Colors.white70),
            ),
          ),

          const SizedBox(height: 32),

          // 2. Weather Risk
          _buildSectionTitle('AI HAVA ANALİZİ', LucideIcons.cloudRain),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(LucideIcons.cloudSun, color: Colors.orange),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.weatherCondition,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sıcaklık: ${data.temperature}°C. Şu an park için hava durumu uygun görünüyor.',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // 3. Occupancy Prediction
          _buildSectionTitle('DOLULUK DURUMU', LucideIcons.barChart2),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
               color: Colors.black,
               borderRadius: BorderRadius.circular(16),
               border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Toplam Kapasite: ${data.totalSpots}', style: TextStyle(color: Colors.grey)),
                     Text('Dolu: ${data.occupiedSpots}', style: TextStyle(color: AppTheme.errorRed)),
                   ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: data.occupancyRate,
                  backgroundColor: Colors.grey[800],
                  color: data.occupancyRate > 0.8 ? AppTheme.errorRed : AppTheme.secondaryGreen,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('ANLAŞILDI'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.secondaryCyan, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: AppTheme.secondaryCyan,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Color _getSafetyColor(double score) {
    if (score > 8) return AppTheme.secondaryGreen;
    if (score > 5) return Colors.orange;
    return AppTheme.errorRed;
  }
}

// Painters

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryBlue.withOpacity(0.05)
      ..strokeWidth = 1;

    const double spacing = 40;
    
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryBlue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    // Simulate a curve
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.9, size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.1, size.width, size.height * 0.4);

    // Gradient Fill
    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [AppTheme.primaryBlue.withOpacity(0.4), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Draw Points
    final pointsPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 4, pointsPaint);
    canvas.drawCircle(Offset(size.width * 0.82, size.height * 0.28), 4, pointsPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
