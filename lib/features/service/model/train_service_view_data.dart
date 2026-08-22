import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service.dart';

class DrivingPosition {
  const DrivingPosition({
    required this.position,
    required this.isDirectionUp,
    required this.delay,
  });

  final int position;
  final bool isDirectionUp;
  final String delay;
}

class TrainServiceViewData {
  const TrainServiceViewData({
    required this.station,
    required this.trainsDrivingPositionUp,
    required this.trainsDrivingPositionDown,
  });
  final Station station;
  final List<DrivingPosition>? trainsDrivingPositionUp;
  final List<DrivingPosition>? trainsDrivingPositionDown;
}

class TrainServiceViewDataList {
  final List<TrainServiceViewData> trainServiceViewDatas;

  TrainServiceViewDataList(List<TrainService> trainServices)
    : trainServiceViewDatas = _createPosition(trainServices);

  static List<TrainServiceViewData> _createPosition(
    List<TrainService> trainServices,
  ) {
    final positions = trainServices
        .map((trainService) {
          final fromStation = Station.toStation(trainService.fromStation);
          final toStation = Station.toStation(trainService.toStation);
          bool isDirectionUp;
          try {
            isDirectionUp = RailDirection.isRailDirectionUp(
              trainService.railDirection,
            );
          } catch (e) {
            return null;
          }

          if (fromStation == null) {
            return null;
          }

          final position = toStation == null
              ? fromStation.order
              : ((fromStation.order + toStation.order) / 2).toInt();

          return DrivingPosition(
            position: position,
            isDirectionUp: isDirectionUp,
            delay: trainService.delay,
          );
        })
        .whereType<DrivingPosition>()
        .toList();

    final trainServiceViewData = Station.irIshikawaStations.map((
      Station station,
    ) {
      final trainsDrivingPositionUp = positions
          .where(
            (DrivingPosition train) =>
                (train.position == station.order) && train.isDirectionUp,
          )
          .toList();

      final trainsDrivingPositionDown = positions
          .where(
            (DrivingPosition train) =>
                (train.position == station.order) && !train.isDirectionUp,
          )
          .toList();

      return TrainServiceViewData(
        station: station,
        trainsDrivingPositionUp: trainsDrivingPositionUp,
        trainsDrivingPositionDown: trainsDrivingPositionDown,
      );
    }).toList();

    return trainServiceViewData;
  }
}

class Station {
  static const Station kurikara = Station(name: '倶利伽羅', order: 38);
  static const Station tsubata = Station(name: '津幡', order: 36);
  static const Station morimoto = Station(name: '森本', order: 34);
  static const Station higashikanazawa = Station(name: '東金沢', order: 32);
  static const Station kanazawa = Station(name: '金沢', order: 30);
  static const Station nishikanazawa = Station(name: '西金沢', order: 28);
  static const Station nonoichi = Station(name: '野々市', order: 26);
  static const Station matto = Station(name: '松任', order: 24);
  static const Station nishimatto = Station(name: '西松任', order: 22);
  static const Station kagakasama = Station(name: '加賀笠間', order: 20);
  static const Station mikawa = Station(name: '美川', order: 18);
  static const Station komaiko = Station(name: '小舞子', order: 16);
  static const Station nomineagari = Station(name: '能美根上', order: 14);
  static const Station meiho = Station(name: '明峰', order: 12);
  static const Station komatsu = Station(name: '小松', order: 10);
  static const Station awazu = Station(name: '粟津', order: 8);
  static const Station iburihashi = Station(name: '動橋', order: 6);
  static const Station kagaonsen = Station(name: '加賀温泉', order: 4);
  static const Station daishoji = Station(name: '大聖寺', order: 2);

  const Station({required this.name, required this.order});

  final String? name;
  final int order;

  static Station? toStation(String station) {
    switch (station) {
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kurikara':
        return Station.kurikara;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Tsubata':
        return Station.tsubata;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Morimoto':
        return Station.morimoto;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Higashi-Kanazawa':
        return Station.higashikanazawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kanazawa':
        return Station.kanazawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Kanazawa':
        return Station.nishikanazawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nonoichi':
        return Station.nonoichi;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Matto':
        return Station.matto;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Matto':
        return Station.nishimatto;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kaga-Kasama':
        return Station.kagakasama;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Mikawa':
        return Station.mikawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Komaiko':
        return Station.komaiko;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nomi-Neagari':
        return Station.nomineagari;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Meiho':
        return Station.meiho;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Komatsu':
        return Station.komatsu;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Awazu':
        return Station.awazu;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Iburihashi':
        return Station.iburihashi;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kagaonsen':
        return Station.kagaonsen;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Daishoji':
        return Station.daishoji;
      default:
        return null;
    }
  }

  static const List<Station> irIshikawaStations = [
    Station(name: null, order: 1),
    .daishoji,
    Station(name: null, order: 3),
    .kagaonsen,
    Station(name: null, order: 5),
    .iburihashi,
    Station(name: null, order: 7),
    .awazu,
    Station(name: null, order: 9),
    .komatsu,
    Station(name: null, order: 11),
    .meiho,
    Station(name: null, order: 13),
    .nomineagari,
    Station(name: null, order: 15),
    .komaiko,
    Station(name: null, order: 17),
    .mikawa,
    Station(name: null, order: 19),
    .kagakasama,
    Station(name: null, order: 21),
    .matto,
    Station(name: null, order: 23),
    .nishimatto,
    Station(name: null, order: 25),
    .nonoichi,
    Station(name: null, order: 27),
    .nishikanazawa,
    Station(name: null, order: 29),
    .kanazawa,
    Station(name: null, order: 31),
    .higashikanazawa,
    Station(name: null, order: 33),
    .morimoto,
    Station(name: null, order: 35),
    .tsubata,
    Station(name: null, order: 37),
    .kurikara,
    Station(name: null, order: 39),
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
