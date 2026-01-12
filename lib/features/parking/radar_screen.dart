import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:location/location.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:go_router/go_router.dart';

class RadarScreen extends StatefulWidget {
  final double targetLat;
  final double targetLng;

  const RadarScreen({
    super.key,
    required this.targetLat,
    required this.targetLng,
  });

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen> with SingleTickerProviderStateMixin {
  final Location _location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  StreamSubscription<CompassEvent>? _compassSubscription;
  late AnimationController _radarController;

  double? _heading;
  LocationData? _currentLocation;
  double _distance = 0.0;
  double _bearing = 0.0;

  @override
  void initState() {
    super.initState();
    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _initSensors();
  }

  void _initSensors() async {
    // Compass
    _compassSubscription = FlutterCompass.events?.listen((event) {
      if (mounted) {
        setState(() {
          _heading = event.heading;
        });
      }
    });

    // Location
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    _locationSubscription = _location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          _currentLocation = currentLocation;
          if (_currentLocation != null) {
            _updateCalculations();
          }
        });
      }
    });
  }

  void _updateCalculations() {
    if (_currentLocation == null) return;
    

    
    const R = 6371e3; // metres
    final lat1 = _currentLocation!.latitude! * math.pi / 180;
    final lat2 = widget.targetLat * math.pi / 180;
    final dLat = (widget.targetLat - _currentLocation!.latitude!) * math.pi / 180;
    final dLon = (widget.targetLng - _currentLocation!.longitude!) * math.pi / 180;

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) * math.cos(lat2) *
        math.sin(dLon / 2) * math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    _distance = R * c;

    // Bearing
    final y = math.sin(dLon) * math.cos(lat2);
    final x = math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(dLon);
    _bearing = math.atan2(y, x) * 180 / math.pi;
    _bearing = (_bearing + 360) % 360;
  }

  @override
  void dispose() {
    _radarController.dispose();
    _locationSubscription?.cancel();
    _compassSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final heading = _heading ?? 0.0;
    final direction = (_bearing - heading + 360) % 360;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Radar Grid Background
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: RadarGridPainter(_radarController),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(LucideIcons.x, color: Colors.white),
                        onPressed: () => context.pop(),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.primaryBlue),
                        ),
                        child: const Text(
                          'SİNYAL ALINIYOR',
                          style: TextStyle(
                            color: AppTheme.primaryBlue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            fontSize: 12
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Direction Arrow
                Transform.rotate(
                  angle: (direction * (math.pi / 180)),
                  child: Icon(
                    LucideIcons.navigation,
                    size: 100,
                    color: _distance < 10 ? AppTheme.secondaryGreen : AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: 50),
                
                 // Distance Text
                Text(
                  _distance.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                const Text(
                  'METRE',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    letterSpacing: 4,
                  ),
                ),
                
                const Spacer(),
                
                if (_heading == null)
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'Pusula sensörü bulunamadı veya simülatör kullanılıyor.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RadarGridPainter extends CustomPainter {
  final Animation<double> animation;

  RadarGridPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2 * 0.9;
    
    final paint = Paint()
      ..color = AppTheme.primaryBlue.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Circles
    for (int i = 1; i <= 4; i++) {
      canvas.drawCircle(center, maxRadius * (i / 4), paint);
    }
    
    // Cross lines
    canvas.drawLine(Offset(center.dx, center.dy - maxRadius), Offset(center.dx, center.dy + maxRadius), paint);
    canvas.drawLine(Offset(center.dx - maxRadius, center.dy), Offset(center.dx + maxRadius, center.dy), paint);

    // Scanner
    final sweepPaint = Paint()
      ..shader = SweepGradient(
        center: Alignment.center,
        startAngle: 0.0,
        endAngle: math.pi * 2,
        colors: [
           Colors.transparent,
           AppTheme.primaryBlue.withValues(alpha: 0.1),
           AppTheme.primaryBlue.withValues(alpha: 0.5),
        ],
        stops: const [0.0, 0.5, 1.0],
        transform: GradientRotation(animation.value * 2 * math.pi),
      ).createShader(Rect.fromCircle(center: center, radius: maxRadius));
      
    canvas.drawCircle(center, maxRadius, sweepPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
