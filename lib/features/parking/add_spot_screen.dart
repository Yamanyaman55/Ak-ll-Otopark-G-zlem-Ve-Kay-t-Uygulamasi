import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';
import 'package:park_note/features/map/map_controller.dart';
import 'package:park_note/features/parking/parking_spot_model.dart';

class AddSpotScreen extends ConsumerStatefulWidget {
  const AddSpotScreen({super.key});

  @override
  ConsumerState<AddSpotScreen> createState() => _AddSpotScreenState();
}

class _AddSpotScreenState extends ConsumerState<AddSpotScreen> {
  String? _imagePath;
  ParkingStatus _selectedStatus = ParkingStatus.available;
  final TextEditingController _notesController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Parking Spot'),
        leading: IconButton(
          icon: const Icon(LucideIcons.x),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () async {
                final result = await context.push<String>('/camera');
                if (result != null) {
                  setState(() {
                    _imagePath = result;
                  });
                }
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  image: _imagePath != null
                      ? DecorationImage(
                          image: FileImage(File(_imagePath!)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _imagePath == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(LucideIcons.camera, size: 40, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('Tap to take photo', style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 24),
            Text('Status', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            SegmentedButton<ParkingStatus>(
              segments: const [
                ButtonSegment(
                  value: ParkingStatus.available,
                  label: Text('Available'),
                  icon: Icon(LucideIcons.checkCircle),
                ),
                ButtonSegment(
                  value: ParkingStatus.occupied,
                  label: Text('Occupied'),
                  icon: Icon(LucideIcons.xCircle),
                ),
              ],
              selected: {_selectedStatus},
              onSelectionChanged: (Set<ParkingStatus> newSelection) {
                setState(() {
                  _selectedStatus = newSelection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (states) {
                    if (states.contains(WidgetState.selected)) {
                      return _selectedStatus == ParkingStatus.available
                          ? AppTheme.secondaryGreen.withValues(alpha: 0.2)
                          : AppTheme.errorRed.withValues(alpha: 0.2);
                    }
                    return null;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                   (states) {
                     if (states.contains(WidgetState.selected)) {
                         return _selectedStatus == ParkingStatus.available
                          ? AppTheme.secondaryGreen
                          : AppTheme.errorRed;
                     }
                      return Colors.grey;
                   }
                )
              ),
            ),
            const SizedBox(height: 24),
            Text('Notes', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'e.g., Street sweeping on Tuesdays',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveSpot,
              child: const Text('Save Spot'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveSpot() async {
    // Get current location
    final latLng = await ref.read(mapControllerProvider.notifier).getUserLocation();
    
    if (latLng == null) {
      if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not get location')));
      }
      return;
    }


    
    await ref.read(mapControllerProvider.notifier).addSpot(
      latLng, 
      _selectedStatus,
      photoPath: _imagePath,
      notes: _notesController.text
    );
    
    if (mounted) {
      context.pop();
    }
  }
}
