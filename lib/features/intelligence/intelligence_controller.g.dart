// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intelligence_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IntelligenceController)
const intelligenceControllerProvider = IntelligenceControllerProvider._();

final class IntelligenceControllerProvider
    extends $AsyncNotifierProvider<IntelligenceController, IntelligenceData> {
  const IntelligenceControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'intelligenceControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$intelligenceControllerHash();

  @$internal
  @override
  IntelligenceController create() => IntelligenceController();
}

String _$intelligenceControllerHash() =>
    r'166347ff63fe80dfba6a73ff887997e533efa0a9';

abstract class _$IntelligenceController
    extends $AsyncNotifier<IntelligenceData> {
  FutureOr<IntelligenceData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<IntelligenceData>, IntelligenceData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<IntelligenceData>, IntelligenceData>,
              AsyncValue<IntelligenceData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
