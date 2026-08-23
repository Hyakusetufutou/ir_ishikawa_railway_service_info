import 'package:ir_ishikawa_railway_service_info/features/service/model/driving_train.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/rail_view_item.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/station.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_location.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service.dart';

class TrainServiceViewDataList {
  TrainServiceViewDataList(List<TrainService> trainServices)
    : trainServiceViewDatas = _createViewData(trainServices);

  final List<RailViewItem> trainServiceViewDatas;

  static List<RailViewItem> _createViewData(List<TrainService> trainServices) {
    final trains = trainServices
        .map(_createDrivingTrain)
        .whereType<DrivingTrain>()
        .toList();

    final result = <RailViewItem>[];

    for (int i = 0; i < Station.irIshikawaStations.length; i++) {
      final station = Station.irIshikawaStations[i];

      // 駅
      result.add(
        StationViewItem(
          station: station,
          upTrains: _trainsAtStation(trains, station, TrainDirection.up),
          downTrains: _trainsAtStation(trains, station, TrainDirection.down),
        ),
      );

      // 駅間
      if (i < Station.irIshikawaStations.length - 1) {
        final nextStation = Station.irIshikawaStations[i + 1];

        result.add(
          StationIntervalViewItem(
            from: station,
            to: nextStation,
            upTrains: _trainsBetweenStations(
              trains,
              nextStation,
              station,
              TrainDirection.up,
            ),
            downTrains: _trainsBetweenStations(
              trains,
              station,
              nextStation,
              TrainDirection.down,
            ),
          ),
        );
      }
    }

    return result;
  }

  static DrivingTrain? _createDrivingTrain(TrainService trainService) {
    final fromStation = Station.fromOdptId(trainService.fromStation);

    if (fromStation == null) {
      return null;
    }

    final toStation = Station.fromOdptId(trainService.toStation);

    final direction = TrainDirection.fromOdpt(trainService.railDirection);

    if (direction == null) {
      return null;
    }

    final destination = Station.terminalOdptId(trainService.terminalStation);

    if (destination == null) {
      return null;
    }

    final train = Train(
      id: trainService.number,
      type: TrainType.fromOdpt(trainService.type),
      destination: destination,
      delay: trainService.delay,
    );

    final location = _createTrainLocation(
      fromStation: fromStation,
      toStation: toStation,
    );

    return DrivingTrain(train: train, location: location, direction: direction);
  }

  static TrainLocation _createTrainLocation({
    required Station fromStation,
    required Station? toStation,
  }) {
    if (toStation == null) {
      return AtStation(station: fromStation);
    }

    return BetweenStations(from: fromStation, to: toStation);
  }

  static List<DrivingTrain> _trainsAtStation(
    List<DrivingTrain> trains,
    Station station,
    TrainDirection direction,
  ) {
    return trains.where((train) {
      if (train.direction != direction) {
        return false;
      }

      final location = train.location;

      return location is AtStation && location.station == station;
    }).toList();
  }

  static List<DrivingTrain> _trainsBetweenStations(
    List<DrivingTrain> trains,
    Station from,
    Station to,
    TrainDirection direction,
  ) {
    return trains.where((train) {
      if (train.direction != direction) {
        return false;
      }

      final location = train.location;

      return location is BetweenStations &&
          location.from == from &&
          location.to == to;
    }).toList();
  }
}

class RailDirection {
  static bool isRailDirectionUp(String railDirection) {
    switch (railDirection) {
      case 'odpt.RailDirection:IRIshikawa.Fukui':
        return true;
      case 'odpt.RailDirection:IRIshikawa.Toyama':
        return false;
      default:
        throw '行き先不明';
    }
  }
}
