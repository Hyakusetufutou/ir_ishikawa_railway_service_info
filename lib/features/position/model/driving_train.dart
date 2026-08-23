import 'package:ir_ishikawa_railway_service_info/features/position/model/train.dart';
import 'package:ir_ishikawa_railway_service_info/features/position/model/train_location.dart';

class DrivingTrain {
  const DrivingTrain({
    required this.train,
    required this.location,
    required this.direction,
  });

  final Train train;
  final TrainLocation location;
  final TrainDirection direction;
}
