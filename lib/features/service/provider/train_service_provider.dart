import 'package:ir_ishikawa_railway_service_info/features/service/data_source/train_api.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service_view_data.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/repository/train_service_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'train_service_provider.g.dart';

@riverpod
TrainServiceRepository trainServiceRepository(Ref ref) {
  return TrainServiceRepository(TrainApi());
}

@riverpod
Future<TrainServiceViewDataList> trains(Ref ref) async {
  final repository = ref.watch(trainServiceRepositoryProvider);

  final trainServices = await repository.fetchTrains();

  return TrainServiceViewDataList(trainServices);
}
