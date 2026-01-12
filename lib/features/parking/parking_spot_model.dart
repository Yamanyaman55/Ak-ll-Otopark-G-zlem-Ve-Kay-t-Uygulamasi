import 'package:google_maps_flutter/google_maps_flutter.dart';

enum ParkingStatus {
  available,
  occupied,
  unknown,
}

class ParkingSpot {
  final String id;
  final LatLng location;
  final ParkingStatus status;
  final String? photoPath;
  final String? notes;
  final DateTime timestamp;
  final int? userId; // Owner of the spot

  ParkingSpot({
    required this.id,
    required this.location,
    required this.status,
    this.photoPath,
    this.notes,
    required this.timestamp,
    this.userId,
  });

  ParkingSpot copyWith({
    String? id,
    LatLng? location,
    ParkingStatus? status,
    String? photoPath,
    String? notes,
    DateTime? timestamp,
    int? userId,
  }) {
    return ParkingSpot(
      id: id ?? this.id,
      location: location ?? this.location,
      status: status ?? this.status,
      photoPath: photoPath ?? this.photoPath,
      notes: notes ?? this.notes,
      timestamp: timestamp ?? this.timestamp,
      userId: userId ?? this.userId,
    );
  }
}
