import 'package:ir_ishikawa_railway_service_info/features/info/data_source/train_info_api.dart';
import 'package:ir_ishikawa_railway_service_info/features/info/model/train_information.dart';
import 'package:ir_ishikawa_railway_service_info/features/info/repository/train_info_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'train_info_provider.g.dart';

@riverpod
TrainInfoRepository trainInfoRepository(Ref ref) {
  return TrainInfoRepository(TrainInfoApi());
}

@riverpod
Future<TrainInformation> trainInformation(Ref ref) async {
  final repository = ref.watch(trainInfoRepositoryProvider);

  final information = await repository.fetchTrainInfo();

  return information;
}
