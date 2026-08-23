import 'package:ir_ishikawa_railway_service_info/features/position/data_source/train_api.dart';
import 'package:ir_ishikawa_railway_service_info/features/position/model/train_service.dart';

class TrainServiceRepository {
  TrainServiceRepository(this._api);

  final TrainApi _api;

  Future<List<TrainService>> fetchTrains() {
    return _api.fetchTrains();
  }
}
