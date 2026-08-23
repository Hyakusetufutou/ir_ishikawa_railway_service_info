class TrainInformation {
  const TrainInformation({required this.date, required this.text});

  final String date;
  final String text;

  factory TrainInformation.fromJson(dynamic json) {
    return TrainInformation(
      date: json['dc:date'] as String,
      text: json['odpt:trainInformationText'] as String,
    );
  }
}
