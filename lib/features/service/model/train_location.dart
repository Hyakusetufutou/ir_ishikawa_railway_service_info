import 'package:ir_ishikawa_railway_service_info/features/service/model/station.dart';

sealed class TrainLocation {
  const TrainLocation();
}

class AtStation extends TrainLocation {
  const AtStation({required this.station});

  final Station station;
}

class BetweenStations extends TrainLocation {
  const BetweenStations({required this.from, required this.to});

  final Station from;
  final Station to;
}
