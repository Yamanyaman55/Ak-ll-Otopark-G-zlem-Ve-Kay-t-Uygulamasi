import 'dart:io' as java_io;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/map/map_controller.dart';
import 'package:park_note/features/parking/parking_spot_model.dart';
import 'package:park_note/features/parking/parking_session_controller.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  GoogleMapController? _mapController;
  static const LatLng _initialPosition = LatLng(41.0082, 28.9784); // Istanbul Default
  ParkingStatus? _selectedFilter;
  @override
  Widget build(BuildContext context) {
    final spotsAsync = ref.watch(mapControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          spotsAsync.when(
            data: (spots) {
              final filteredSpots = _selectedFilter == null 
                  ? spots 
                  : spots.where((s) => s.status == _selectedFilter).toList();

              return GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: _initialPosition,
                  zoom: 15,
                ),
                onMapCreated: (controller) {
                  _mapController = controller;
                  _checkLocationAndMove(ref);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                markers: filteredSpots.map((spot) => _createMarker(spot)).toSet(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                _buildSearchBar(context),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('Hepsi', null),
                      const SizedBox(width: 8),
                      _buildFilterChip('Boş', ParkingStatus.available),
                      const SizedBox(width: 8),
                      _buildFilterChip('Dolu', ParkingStatus.occupied),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 110,
            left: 20,
            child: Consumer(
              builder: (context, ref, child) {
                final sessionAsync = ref.watch(parkingSessionControllerProvider);
                final session = sessionAsync.value;

                return GestureDetector(
                  onTap: () => context.push('/smart-parking'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: AppTheme.glassBoxDecoration(
                      color: session != null ? AppTheme.primaryBlue : Colors.white,
                      opacity: 0.8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.parkingCircle,
                          color: session != null ? Colors.white : AppTheme.primaryBlue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          session != null ? 'Park Halinde' : 'Akıllı Park',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: session != null ? Colors.white : AppTheme.primaryBlue,
                          ),
                        ),
                        if (session != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppTheme.accentAmber,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 110,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'recenter',
              mini: true,
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.primaryBlue,
              onPressed: () => _checkLocationAndMove(ref),
              child: const Icon(LucideIcons.crosshair),
            ),
          ),
          Positioned(
            bottom: 180,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'ai_scan',
              mini: true,
              backgroundColor: Colors.black87,
              foregroundColor: AppTheme.secondaryCyan,
              onPressed: () => context.push('/intelligence'),
              child: const Icon(LucideIcons.brainCircuit),
            ),
          ),
        ],
      ),
    );
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search location...',
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              onChanged: (value) {

                ref.read(mapControllerProvider.notifier).searchSpots(value);
              },
            ),
          ),
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(LucideIcons.x, color: Colors.grey),
              onPressed: () {
                _searchController.clear();
                ref.read(mapControllerProvider.notifier).searchSpots('');
                setState(() {});
              },
            ),
          const Icon(LucideIcons.slidersHorizontal, color: AppTheme.primaryBlue),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, ParkingStatus? status) {
    final isSelected = _selectedFilter == status;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = status;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
             BoxShadow(
               color: Colors.black.withValues(alpha: 0.1),
               blurRadius: 4,
               offset: const Offset(0, 2),
             ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Marker _createMarker(ParkingSpot spot) {

    double hue;
    switch (spot.status) {
      case ParkingStatus.available:
        hue = BitmapDescriptor.hueGreen;
        break;
      case ParkingStatus.occupied:
        hue = BitmapDescriptor.hueRed;
        break;
      case ParkingStatus.unknown:
        hue = BitmapDescriptor.hueYellow;
        break;
    }

    return Marker(
      markerId: MarkerId(spot.id),
      position: spot.location,
      icon: BitmapDescriptor.defaultMarkerWithHue(hue),
      infoWindow: InfoWindow(
        title: spot.status.name.toUpperCase(),
        snippet: spot.notes ?? 'No notes',
      ),
      onTap: () {
        _showSpotDetails(context, spot);
      },
    );
  }

  void _showSpotDetails(BuildContext context, ParkingSpot spot) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E293B),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.45,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: spot.status == ParkingStatus.available 
                                  ? AppTheme.secondaryGreen.withOpacity(0.1) 
                                  : AppTheme.errorRed.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              spot.status == ParkingStatus.available 
                                  ? LucideIcons.checkCircle 
                                  : LucideIcons.xCircle,
                              color: spot.status == ParkingStatus.available 
                                  ? AppTheme.secondaryGreen 
                                  : AppTheme.errorRed,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                spot.status == ParkingStatus.available ? 'Müsait' : 'Dolu',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // White text
                                ),
                              ),
                              Text(
                                'Park Yeri #${spot.id}', // Or actual name
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70, // Lighter white
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                           // Favorite logic stub
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Favorilere eklendi (Simülasyon)')));
                        },
                        icon: const Icon(LucideIcons.bookmark, color: AppTheme.secondaryGreen), // Green icon
                        style: IconButton.styleFrom(
                          backgroundColor: AppTheme.secondaryGreen.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (spot.photoPath != null)
                     ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.file(
                         java_io.File(spot.photoPath!),
                         height: 200,
                         width: double.infinity,
                         fit: BoxFit.cover,
                       ),
                     ),
                   const SizedBox(height: 24),
                   const Text('Notlar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                   const SizedBox(height: 8),
                   Text(
                     spot.notes ?? 'Not bulunmuyor.',
                     style: const TextStyle(color: Colors.grey, height: 1.5),
                   ),
                   const SizedBox(height: 32),
                   Row(
                     children: [
                       Expanded(
                         child: OutlinedButton.icon(
                           onPressed: () => context.pop(),
                           icon: const Icon(LucideIcons.x),
                           label: const Text('Kapat'),
                           style: OutlinedButton.styleFrom(
                             padding: const EdgeInsets.symmetric(vertical: 16),
                             side: const BorderSide(color: Colors.white24), // Subtle border
                             foregroundColor: Colors.white, // White text
                           ),
                         ),
                       ),
                       const SizedBox(width: 16),
                       Expanded(
                         child: ElevatedButton.icon(
                           onPressed: () {
                             ref.read(mapControllerProvider.notifier).launchMapsUrl(
                               spot.location.latitude,
                               spot.location.longitude,
                             );
                           },
                           icon: const Icon(LucideIcons.navigation),
                           label: const Text('Yol Tarifi'),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: AppTheme.secondaryGreen, // Green button
                             foregroundColor: Colors.white,
                             padding: const EdgeInsets.symmetric(vertical: 16),
                           ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _checkLocationAndMove(WidgetRef ref) async {
    final location = await ref.read(mapControllerProvider.notifier).getUserLocation();
    if (location != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: location, zoom: 16),
        ),
      );
    }
  }
}
