import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:park_note/features/home/home_screen.dart';
import 'package:park_note/features/auth/login_screen.dart';
import 'package:park_note/features/auth/register_screen.dart';
import 'package:park_note/features/onboarding/onboarding_screen.dart';
import 'package:park_note/features/map/map_screen.dart';
import 'package:park_note/features/activity/activity_screen.dart';
import 'package:park_note/features/parking/add_spot_screen.dart';
import 'package:park_note/features/parking/camera_screen.dart';
import 'package:park_note/features/profile/profile_screen.dart';
import 'package:park_note/features/profile/settings_screen.dart';
import 'package:park_note/features/profile/saved_spots_screen.dart';
import 'package:park_note/features/profile/edit_profile_screen.dart';
import 'package:park_note/features/parking/parking_session_screen.dart';
import 'package:park_note/features/parking/parking_history_screen.dart';
import 'package:park_note/features/parking/radar_screen.dart';
import 'package:park_note/features/intelligence/intelligence_screen.dart';
import 'package:park_note/features/admin/admin_dashboard_screen.dart';
import 'package:park_note/shared/scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => const MapScreen(),
        ),
        GoRoute(
          path: '/activity',
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/add-spot',
      builder: (context, state) => const AddSpotScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/saved-spots',
      builder: (context, state) => const SavedSpotsScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/smart-parking',
      builder: (context, state) => const ParkingSessionScreen(),
      routes: [
         GoRoute(
          path: 'radar',
          builder: (context, state) {
            final extras = state.extra as Map<String, dynamic>;
            return RadarScreen(
              targetLat: (extras['lat'] as num).toDouble(),
              targetLng: (extras['lng'] as num).toDouble(),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const ParkingHistoryScreen(),
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) => const CameraScreen(),
    ),
    GoRoute(
      path: '/intelligence',
      builder: (context, state) => const IntelligenceScreen(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminDashboardScreen(),
    ),
  ],
);
