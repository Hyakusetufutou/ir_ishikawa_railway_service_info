import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service.dart';

enum TrainDirection {
  up,
  down;

  static TrainDirection? fromOdpt(String value) {
    switch (value) {
      case 'odpt.RailDirection:IRIshikawa.Fukui':
        return TrainDirection.up;

      case 'odpt.RailDirection:IRIshikawa.Toyama':
        return TrainDirection.down;

      default:
        return null;
    }
  }
}

class DrivingPosition {
  const DrivingPosition({
    required this.position,
    required this.direction,
    required this.delay,
  });

  final int position;
  final TrainDirection direction;
  final String delay;

  bool get isDelayed => delay != '0';
}

class TrainServiceViewData {
  const TrainServiceViewData({
    required this.station,
    required this.upTrains,
    required this.downTrains,
  });

  final Station station;
  final List<DrivingPosition> upTrains;
  final List<DrivingPosition> downTrains;
}

class TrainServiceViewDataList {
  TrainServiceViewDataList(List<TrainService> trainServices)
    : trainServiceViewDatas = _createViewData(trainServices);

  final List<TrainServiceViewData> trainServiceViewDatas;

  static List<TrainServiceViewData> _createViewData(
    List<TrainService> trainServices,
  ) {
    final positions = trainServices
        .map(_createDrivingPosition)
        .whereType<DrivingPosition>()
        .toList();

    return Station.irIshikawaStations.map((station) {
      return TrainServiceViewData(
        station: station,
        upTrains: _trainsAtPosition(positions, station, TrainDirection.up),
        downTrains: _trainsAtPosition(positions, station, TrainDirection.down),
      );
    }).toList();
  }

  static DrivingPosition? _createDrivingPosition(TrainService trainService) {
    final fromStation = Station.fromOdptId(trainService.fromStation);

    if (fromStation == null) {
      return null;
    }

    final toStation = Station.fromOdptId(trainService.toStation);

    final direction = TrainDirection.fromOdpt(trainService.railDirection);

    if (direction == null) {
      return null;
    }

    final position = _calculatePosition(
      fromStation: fromStation,
      toStation: toStation,
    );

    return DrivingPosition(
      position: position,
      direction: direction,
      delay: trainService.delay,
    );
  }

  static int _calculatePosition({
    required Station fromStation,
    required Station? toStation,
  }) {
    if (toStation == null) {
      return fromStation.order;
    }

    return ((fromStation.order + toStation.order) / 2).toInt();
  }

  static List<DrivingPosition> _trainsAtPosition(
    List<DrivingPosition> positions,
    Station station,
    TrainDirection direction,
  ) {
    return positions
        .where(
          (train) =>
              train.position == station.order && train.direction == direction,
        )
        .toList();
  }
}

class Station {
  static const kurikara = Station(
    name: '倶利伽羅',
    order: 38,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kurikara',
  );

  static const tsubata = Station(
    name: '津幡',
    order: 36,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Tsubata',
  );

  static const morimoto = Station(
    name: '森本',
    order: 34,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Morimoto',
  );

  static const higashiKanazawa = Station(
    name: '東金沢',
    order: 32,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Higashi-Kanazawa',
  );

  static const kanazawa = Station(
    name: '金沢',
    order: 30,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kanazawa',
  );

  static const nishiKanazawa = Station(
    name: '西金沢',
    order: 28,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Kanazawa',
  );

  static const nonoichi = Station(
    name: '野々市',
    order: 26,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nonoichi',
  );

  static const matto = Station(
    name: '松任',
    order: 24,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Matto',
  );

  static const nishiMatto = Station(
    name: '西松任',
    order: 22,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Matto',
  );

  static const kagaKasama = Station(
    name: '加賀笠間',
    order: 20,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kaga-Kasama',
  );

  static const mikawa = Station(
    name: '美川',
    order: 18,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Mikawa',
  );

  static const komaiko = Station(
    name: '小舞子',
    order: 16,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Komaiko',
  );

  static const nomiNeagari = Station(
    name: '能美根上',
    order: 14,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nomi-Neagari',
  );

  static const meiho = Station(
    name: '明峰',
    order: 12,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Meiho',
  );

  static const komatsu = Station(
    name: '小松',
    order: 10,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Komatsu',
  );

  static const awazu = Station(
    name: '粟津',
    order: 8,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Awazu',
  );

  static const iburihashi = Station(
    name: '動橋',
    order: 6,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Iburihashi',
  );

  static const kagaonsen = Station(
    name: '加賀温泉',
    order: 4,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kagaonsen',
  );

  static const daishoji = Station(
    name: '大聖寺',
    order: 2,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Daishoji',
  );

  const Station({
    required this.name,
    required this.order,
    required this.odptId,
  });

  final String name;
  final int order;
  final String odptId;

  static const List<Station> namedStations = [
    daishoji,
    kagaonsen,
    iburihashi,
    awazu,
    komatsu,
    meiho,
    nomiNeagari,
    komaiko,
    mikawa,
    kagaKasama,
    nishiMatto,
    matto,
    nonoichi,
    nishiKanazawa,
    kanazawa,
    higashiKanazawa,
    morimoto,
    tsubata,
    kurikara,
  ];

  static final Map<String, Station> _byOdptId = {
    for (final station in namedStations) station.odptId: station,
  };

  static Station? fromOdptId(String id) {
    return _byOdptId[id];
  }

  /// 画面に表示する順番
  ///
  /// 駅と駅の間にも列車を配置できるよう、
  /// orderを1ずつ増やしている。
  static const List<Station> irIshikawaStations = [
    Station(name: '', order: 1, odptId: ''),
    daishoji,
    Station(name: '', order: 3, odptId: ''),
    kagaonsen,
    Station(name: '', order: 5, odptId: ''),
    iburihashi,
    Station(name: '', order: 7, odptId: ''),
    awazu,
    Station(name: '', order: 9, odptId: ''),
    komatsu,
    Station(name: '', order: 11, odptId: ''),
    meiho,
    Station(name: '', order: 13, odptId: ''),
    nomiNeagari,
    Station(name: '', order: 15, odptId: ''),
    komaiko,
    Station(name: '', order: 17, odptId: ''),
    mikawa,
    Station(name: '', order: 19, odptId: ''),
    kagaKasama,
    Station(name: '', order: 21, odptId: ''),
    matto,
    Station(name: '', order: 23, odptId: ''),
    nishiMatto,
    Station(name: '', order: 25, odptId: ''),
    nonoichi,
    Station(name: '', order: 27, odptId: ''),
    nishiKanazawa,
    Station(name: '', order: 29, odptId: ''),
    kanazawa,
    Station(name: '', order: 31, odptId: ''),
    higashiKanazawa,
    Station(name: '', order: 33, odptId: ''),
    morimoto,
    Station(name: '', order: 35, odptId: ''),
    tsubata,
    Station(name: '', order: 37, odptId: ''),
    kurikara,
    Station(name: '', order: 39, odptId: ''),
  ];
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
