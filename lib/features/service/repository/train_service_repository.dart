import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service.dart';

class TrainServiceRepository {
  TrainServiceRepository(this._client);

  final http.Client _client;

  Future<List<TrainService>> fetchTrainService() async {
    final uri = Uri.parse('https://www.ishikawa-railway.jp/api/v1/trains');
    final response = await _client.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic json) => TrainService.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
