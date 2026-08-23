import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/driving_train.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/rail_view_item.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/train.dart';
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
          final items = serviceDatas.trainServiceViewDatas;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return switch (item) {
                StationViewItem item => _StationRow(data: item),
                StationIntervalViewItem item => _StationIntervalRow(data: item),
              };
            },
          );
        },
      ),
    );
  }
}

class _StationRow extends StatelessWidget {
  const _StationRow({required this.data});

  final StationViewItem data;

  static const double trackWidth = 10;
  static const double trainWidth = 32;
  static const double trainSpacing = 10;
  static const double trackToTrainSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final center = constraints.maxWidth / 2;

          return Stack(
            children: [
              // 線路
              Positioned(
                left: center - trackWidth / 2,
                top: 0,
                bottom: 0,
                child: Container(width: trackWidth, color: Colors.blue),
              ),

              // 駅
              Positioned(
                left: center - 10,
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

              // 駅名
              Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    data.station.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),

              // 上り列車
              for (int i = 0; i < data.upTrains.length; i++)
                Positioned(
                  left:
                      center -
                      trackWidth / 2 -
                      trackToTrainSpacing -
                      trainWidth -
                      i * (trainWidth + trainSpacing),
                  top: 8,
                  child: _TrainIcon(
                    train: data.upTrains[i],
                    direction: TrainDirection.up,
                  ),
                ),

              // 下り列車
              for (int i = 0; i < data.downTrains.length; i++)
                Positioned(
                  left:
                      center +
                      trackWidth / 2 +
                      trackToTrainSpacing +
                      i * (trainWidth + trainSpacing),
                  top: 8,
                  child: _TrainIcon(
                    train: data.downTrains[i],
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

class _StationIntervalRow extends StatelessWidget {
  const _StationIntervalRow({required this.data});

  final StationIntervalViewItem data;

  static const double trackWidth = 10;
  static const double trainWidth = 32;
  static const double trainSpacing = 10;
  static const double trackToTrainSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final center = constraints.maxWidth / 2;

          return Stack(
            children: [
              // 線路
              Positioned(
                left: center - trackWidth / 2,
                top: 0,
                bottom: 0,
                child: Container(width: trackWidth, color: Colors.blue),
              ),

              // 上り列車
              for (int i = 0; i < data.upTrains.length; i++)
                Positioned(
                  left:
                      center -
                      trackWidth / 2 -
                      trackToTrainSpacing -
                      trainWidth -
                      i * (trainWidth + trainSpacing),
                  top: 10,
                  child: _TrainIcon(
                    train: data.upTrains[i],
                    direction: TrainDirection.up,
                  ),
                ),

              // 下り列車
              for (int i = 0; i < data.downTrains.length; i++)
                Positioned(
                  left:
                      center +
                      trackWidth / 2 +
                      trackToTrainSpacing +
                      i * (trainWidth + trainSpacing),
                  top: 10,
                  child: _TrainIcon(
                    train: data.downTrains[i],
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

class _TrainIcon extends StatelessWidget {
  const _TrainIcon({required this.train, required this.direction});

  final DrivingTrain train;
  final TrainDirection direction;

  @override
  Widget build(BuildContext context) {
    final isDelayed = train.train.isDelayed;

    // 遅延なし = 緑
    // 遅延あり = オレンジ
    final color = isDelayed ? Colors.orange : Colors.green;

    return SizedBox(
      width: 32,
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (direction == TrainDirection.up)
            Icon(Icons.arrow_drop_up, color: color, size: 20)
          else if (isDelayed)
            SizedBox(height: 20, child: Text('${train.train.delay}分'))
          else
            const SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              _showTrainDetail(context, train);
            },
            child: Icon(Icons.train, color: train.train.type.color, size: 24),
          ),

          if (direction == TrainDirection.down)
            Icon(Icons.arrow_drop_down, color: color, size: 20)
          else if (isDelayed)
            SizedBox(height: 20, child: Text('${train.train.delay}分'))
          else
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}

void _showTrainDetail(BuildContext context, DrivingTrain drivingTrain) {
  final train = drivingTrain.train;

  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '列車情報',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  Text('列車番号: ${train.id}'),

                  Text('種別: ${train.type.name}'),

                  Text('行き先: ${train.destination.name}'),

                  Text('遅延: ${train.delay}分'),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
