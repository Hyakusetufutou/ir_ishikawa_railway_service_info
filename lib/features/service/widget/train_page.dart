import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train_service_view_data.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/provider/train_service_provider.dart';

class TrainPage extends ConsumerWidget {
  const TrainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceDatas = ref.watch(trainsProvider);

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
      body: serviceDatas.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text('エラーが発生しました: $error'));
        },
        data: (serviceDatas) {
          final datas = serviceDatas.trainServiceViewDatas;
          return ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 80,
                    color: datas[index].station.name == null
                        ? Colors.white
                        : Colors.grey.shade200,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                datas[index].station.name ?? "",
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
                            if (datas[index].station.name != null)
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
                            Row(
                              children: [
                                Spacer(),

                                for (final DrivingPosition trainData
                                    in datas[index].trainsDrivingPositionUp ??
                                        [])
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Transform.translate(
                                          offset: const Offset(0, 6),
                                          child: Icon(
                                            Icons.arrow_drop_up,
                                            color: trainData.delay == "0"
                                                ? Colors.green
                                                : Colors.orange,
                                          ),
                                        ),
                                        const Icon(Icons.train),
                                        Transform.translate(
                                          offset: const Offset(0, -6),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                ),

                                for (final trainData
                                    in datas[index].trainsDrivingPositionDown ??
                                        [])
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Transform.translate(
                                          offset: const Offset(0, 6),
                                          child: Icon(
                                            Icons.arrow_drop_up,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        const Icon(Icons.train),
                                        Transform.translate(
                                          offset: const Offset(0, -6),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: trainData.delay == "0"
                                                ? Colors.green
                                                : Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
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
