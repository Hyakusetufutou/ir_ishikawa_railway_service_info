import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ir_ishikawa_railway_service_info/features/position/model/train_service.dart';
import 'package:ir_ishikawa_railway_service_info/features/info/model/train_information.dart';

class TrainInfoApi {
  TrainInfoApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static final Uri _uri = Uri.parse(
    'https://www.ishikawa-railway.jp/api/v1/message',
  );

  Future<TrainInformation> fetchTrainInfo() async {
    final response = await _client.get(_uri);

    if (response.statusCode != 200) {
      throw Exception(
        '運行情報の取得に失敗しました: '
        '${response.statusCode}',
      );
    }

    final List<dynamic> body = jsonDecode(response.body);

    return TrainInformation.fromJson(body[0]);
  }
}
