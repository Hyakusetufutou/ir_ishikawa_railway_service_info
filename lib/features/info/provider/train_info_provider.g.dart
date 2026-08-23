// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(trainInfoRepository)
final trainInfoRepositoryProvider = TrainInfoRepositoryProvider._();

final class TrainInfoRepositoryProvider
    extends
        $FunctionalProvider<
          TrainInfoRepository,
          TrainInfoRepository,
          TrainInfoRepository
        >
    with $Provider<TrainInfoRepository> {
  TrainInfoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trainInfoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trainInfoRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrainInfoRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrainInfoRepository create(Ref ref) {
    return trainInfoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrainInfoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrainInfoRepository>(value),
    );
  }
}

String _$trainInfoRepositoryHash() =>
    r'754f40b593b8745398e1d7fca13479008ba49ffa';

@ProviderFor(trainInformation)
final trainInformationProvider = TrainInformationProvider._();

final class TrainInformationProvider
    extends
        $FunctionalProvider<
          AsyncValue<TrainInformation>,
          TrainInformation,
          FutureOr<TrainInformation>
        >
    with $FutureModifier<TrainInformation>, $FutureProvider<TrainInformation> {
  TrainInformationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trainInformationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trainInformationHash();

  @$internal
  @override
  $FutureProviderElement<TrainInformation> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TrainInformation> create(Ref ref) {
    return trainInformation(ref);
  }
}

String _$trainInformationHash() => r'575f6943f60b9514a836f3d5524b88254dbf350a';
