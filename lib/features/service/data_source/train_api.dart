import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service.dart';

class TrainApi {
  Future<List<TrainService>> fetchTrains() async {
    final uri = Uri.parse('https://www.ishikawa-railway.jp/api/v1/trains');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic json) => TrainService.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
