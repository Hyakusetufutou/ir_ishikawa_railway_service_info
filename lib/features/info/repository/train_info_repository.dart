import 'package:ir_ishikawa_railway_service_info/features/info/data_source/train_info_api.dart';
import 'package:ir_ishikawa_railway_service_info/features/info/model/train_information.dart';

class TrainInfoRepository {
  TrainInfoRepository(this._api);

  final TrainInfoApi _api;

  Future<TrainInformation> fetchTrainInfo() {
    return _api.fetchTrainInfo();
  }
}
