// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(trainServiceRepository)
final trainServiceRepositoryProvider = TrainServiceRepositoryProvider._();

final class TrainServiceRepositoryProvider
    extends
        $FunctionalProvider<
          TrainServiceRepository,
          TrainServiceRepository,
          TrainServiceRepository
        >
    with $Provider<TrainServiceRepository> {
  TrainServiceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trainServiceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trainServiceRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrainServiceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrainServiceRepository create(Ref ref) {
    return trainServiceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrainServiceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrainServiceRepository>(value),
    );
  }
}

String _$trainServiceRepositoryHash() =>
    r'a9943201b30864a9c9ddcf4adc11f8e5a8bd79fc';

@ProviderFor(trains)
final trainsProvider = TrainsProvider._();

final class TrainsProvider
    extends
        $FunctionalProvider<
          AsyncValue<TrainServiceViewDataList>,
          TrainServiceViewDataList,
          FutureOr<TrainServiceViewDataList>
        >
    with
        $FutureModifier<TrainServiceViewDataList>,
        $FutureProvider<TrainServiceViewDataList> {
  TrainsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trainsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trainsHash();

  @$internal
  @override
  $FutureProviderElement<TrainServiceViewDataList> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TrainServiceViewDataList> create(Ref ref) {
    return trains(ref);
  }
}

String _$trainsHash() => r'cef70ff872df423e51faae260a16859411cf41cc';
