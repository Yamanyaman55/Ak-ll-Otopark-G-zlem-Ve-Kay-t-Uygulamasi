

part of 'parking_session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************



@ProviderFor(ParkingSessionController)
const parkingSessionControllerProvider = ParkingSessionControllerProvider._();

final class ParkingSessionControllerProvider
    extends $StreamNotifierProvider<ParkingSessionController, dynamic> {
  const ParkingSessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'parkingSessionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$parkingSessionControllerHash();

  @$internal
  @override
  ParkingSessionController create() => ParkingSessionController();
}

String _$parkingSessionControllerHash() =>
    r'99c07280484587b85a5bbbb413d7e4cf095d4d18';

abstract class _$ParkingSessionController extends $StreamNotifier<dynamic> {
  Stream<dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<dynamic>, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<dynamic>, dynamic>,
              AsyncValue<dynamic>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
