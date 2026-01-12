

part of 'map_controller.dart';


@ProviderFor(MapController)
const mapControllerProvider = MapControllerProvider._();

final class MapControllerProvider
    extends $AsyncNotifierProvider<MapController, List<ParkingSpot>> {
  const MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  MapController create() => MapController();
}

String _$mapControllerHash() => r'1e5af9fc0662905ab3f6781319683c6203e253a3';

abstract class _$MapController extends $AsyncNotifier<List<ParkingSpot>> {
  FutureOr<List<ParkingSpot>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ParkingSpot>>, List<ParkingSpot>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ParkingSpot>>, List<ParkingSpot>>,
              AsyncValue<List<ParkingSpot>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
