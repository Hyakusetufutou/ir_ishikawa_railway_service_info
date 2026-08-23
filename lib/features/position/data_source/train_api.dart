import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ir_ishikawa_railway_service_info/features/position/model/train_service.dart';

class TrainApi {
  TrainApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static final Uri _uri = Uri.parse(
    'https://www.ishikawa-railway.jp/api/v1/trains',
  );

  Future<List<TrainService>> fetchTrains() async {
    final response = await _client.get(_uri);

    if (response.statusCode != 200) {
      throw Exception(
        '列車情報の取得に失敗しました: '
        '${response.statusCode}',
      );
    }

    final List<dynamic> body = jsonDecode(response.body);

    return body
        .map((json) => TrainService.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
