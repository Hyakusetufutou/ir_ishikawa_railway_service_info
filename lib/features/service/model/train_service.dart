class TrainService {
  const TrainService({
    required this.number,
    required this.type,
    required this.delay,
    required this.startingStation,
    required this.terminalStation,
    required this.fromStation,
    required this.toStation,
  });

  final String number;
  final String type;
  final String delay;
  final String startingStation;
  final String terminalStation;
  final String fromStation;
  final String toStation;

  factory TrainService.fromJson(dynamic json) {
    return TrainService(
      number: json['trainNumber'] as String,
      type: json['trainType'] as String,
      delay: json['delay'] as String,
      startingStation: json['startingStation'] as String,
      terminalStation: json['terminalStation'] as String,
      fromStation: json['fromStation'] as String,
      toStation: json['toStation'] as String,
    );
  }
}
