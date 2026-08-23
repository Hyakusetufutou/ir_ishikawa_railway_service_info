import 'package:ir_ishikawa_railway_service_info/features/position/model/driving_train.dart';
import 'package:ir_ishikawa_railway_service_info/features/position/model/station.dart';

sealed class RailViewItem {
  const RailViewItem();
}

class StationViewItem extends RailViewItem {
  const StationViewItem({
    required this.station,
    required this.upTrains,
    required this.downTrains,
  });

  final Station station;
  final List<DrivingTrain> upTrains;
  final List<DrivingTrain> downTrains;
}

class StationIntervalViewItem extends RailViewItem {
  const StationIntervalViewItem({
    required this.from,
    required this.to,
    required this.upTrains,
    required this.downTrains,
  });

  final Station from;
  final Station to;
  final List<DrivingTrain> upTrains;
  final List<DrivingTrain> downTrains;
}
