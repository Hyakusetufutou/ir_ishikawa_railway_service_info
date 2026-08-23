import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir_ishikawa_railway_service_info/features/info/provider/train_info_provider.dart';

class InfoPage extends ConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(trainInformationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('運行情報'),
        backgroundColor: const Color.fromARGB(255, 85, 192, 242),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(trainInformationProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: info.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text('エラーが発生しました: $error'));
        },
        data: (info) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: 150,
              width: .infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IRいしかわ鉄道(大聖寺〜倶利伽羅)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(info.text, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
