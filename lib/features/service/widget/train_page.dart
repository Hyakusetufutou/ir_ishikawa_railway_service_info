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
            icon: const Icon(Icons.refresh),
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
              final data = datas[index];

              final upTrains = data.trainsDrivingPositionUp ?? [];

              final downTrains = data.trainsDrivingPositionDown ?? [];

              return _StationRow(
                stationName: data.station.name,
                upTrains: upTrains,
                downTrains: downTrains,
              );
            },
          );
        },
      ),
    );
  }
}

class _StationRow extends StatelessWidget {
  const _StationRow({
    required this.stationName,
    required this.upTrains,
    required this.downTrains,
  });

  final String? stationName;
  final List<DrivingPosition> upTrains;
  final List<DrivingPosition> downTrains;

  // 線路の幅
  static const double trackWidth = 10;

  // 列車アイコンの幅
  static const double trainWidth = 32;

  // 列車同士の間隔
  static const double trainSpacing = 10;

  // 線路と列車の間隔
  static const double trackToTrainSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: stationName == null ? Colors.white : Colors.grey.shade200,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenCenter = constraints.maxWidth / 2;

          return Stack(
            children: [
              // =========================
              // 線路
              // =========================
              Positioned(
                left: screenCenter - trackWidth / 2,
                top: 0,
                bottom: 0,
                child: Container(width: trackWidth, color: Colors.blue),
              ),

              // =========================
              // 駅
              // =========================
              if (stationName != null)
                Positioned(
                  left: screenCenter - 10,
                  top: 30,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 4),
                    ),
                  ),
                ),

              // =========================
              // 駅名
              // =========================
              if (stationName != null)
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      stationName!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

              // =========================
              // 上り列車
              // =========================
              for (int i = 0; i < upTrains.length; i++)
                Positioned(
                  left:
                      screenCenter -
                      trackWidth / 2 -
                      trackToTrainSpacing -
                      trainWidth -
                      (i * (trainWidth + trainSpacing)),
                  top: 5,
                  child: _TrainIcon(
                    trainData: upTrains[i],
                    direction: TrainDirection.up,
                  ),
                ),

              // =========================
              // 下り列車
              // =========================
              for (int i = 0; i < downTrains.length; i++)
                Positioned(
                  left:
                      screenCenter +
                      trackWidth / 2 +
                      trackToTrainSpacing +
                      (i * (trainWidth + trainSpacing)),
                  top: 5,
                  child: _TrainIcon(
                    trainData: downTrains[i],
                    direction: TrainDirection.down,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

enum TrainDirection { up, down }

class _TrainIcon extends StatelessWidget {
  const _TrainIcon({required this.trainData, required this.direction});

  final DrivingPosition trainData;
  final TrainDirection direction;

  @override
  Widget build(BuildContext context) {
    final color = trainData.delay == '0' ? Colors.green : Colors.orange;

    return SizedBox(
      width: 32,
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (direction == TrainDirection.up)
            Icon(Icons.arrow_drop_up, color: color, size: 20)
          else
            const SizedBox(height: 20),

          const Icon(Icons.train, size: 24),

          if (direction == TrainDirection.down)
            Icon(Icons.arrow_drop_down, color: color, size: 20)
          else
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}
