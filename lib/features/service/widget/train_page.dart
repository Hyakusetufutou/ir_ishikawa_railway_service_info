import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service_view_data.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/provider/train_service_provider.dart';

class TrainPage extends ConsumerWidget {
  const TrainPage({super.key});
  static const List<Station> irIshikawaStations = [
    .daishoji,
    .kagaonsen,
    .iburihashi,
    .awazu,
    .komatsu,
    .meiho,
    .nomineagari,
    .komaiko,
    .mikawa,
    .kagakasama,
    .matto,
    .nishimatto,
    .nonoichi,
    .nishikanazawa,
    .kanazawa,
    .higashikanazawa,
    .morimoto,
    .tsubata,
    .kurikara,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trains = ref.watch(trainsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('電車情報'),
        backgroundColor: const Color.fromARGB(255, 85, 192, 242),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(trainsProvider);
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: trains.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text('エラーが発生しました: $error'));
        },
        data: (trains) {
          return ListView.builder(
            itemCount: irIshikawaStations.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 80,
                    color: Colors.grey.shade200,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                irIshikawaStations[index].name,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Container(width: 10, color: Colors.blue),
                            ),
                            Center(
                              child: Container(
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 4,
                                  ),
                                ),
                              ),
                            ),
                            Center(child: Container(child: ,),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Stack(
                      children: [
                        Center(child: Container(width: 10, color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
