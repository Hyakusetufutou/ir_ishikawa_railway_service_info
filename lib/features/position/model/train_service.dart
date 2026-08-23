class TrainService {
  const TrainService({
    required this.number,
    required this.type,
    required this.delay,
    required this.startingStation,
    required this.terminalStation,
    required this.fromStation,
    required this.toStation,
    required this.railDirection,
  });

  final String number;
  final String type;
  final String delay;
  final String startingStation;
  final String terminalStation;
  final String fromStation;
  final String toStation;
  final String railDirection;

  factory TrainService.fromJson(dynamic json) {
    return TrainService(
      number: json['odpt:trainNumber'] as String,
      type: json['odpt:trainType'] as String,
      delay: json['odpt:delay'] as String,
      startingStation: json['odpt:startingStation'] as String,
      terminalStation: json['odpt:terminalStation'] as String,
      fromStation: json['odpt:fromStation'] as String,
      toStation: json['odpt:toStation'] as String,
      railDirection: json['odpt:railDirection'] as String,
    );
  }
}
