import 'package:flutter/material.dart';
import 'package:ir_ishikawa_railway_service_info/features/service/model/station.dart';

enum TrainDirection {
  up,
  down;

  static TrainDirection? fromOdpt(String value) {
    switch (value) {
      case 'odpt.RailDirection:IRIshikawa.Fukui':
        return TrainDirection.up;

      case 'odpt.RailDirection:IRIshikawa.Toyama':
        return TrainDirection.down;

      default:
        return null;
    }
  }
}

enum TrainType {
  local(name: '普通', color: Colors.black),
  rapid(name: '快速', color: Colors.green),
  limitedExpress(name: '特急', color: Colors.purple),
  unknown(name: '', color: Colors.black);

  const TrainType({required this.name, required this.color});
  final String name;
  final Color color;

  static TrainType fromOdpt(String value) {
    switch (value) {
      case 'odpt.TrainType:IRIshikawa.Local':
        return local;
      case 'odpt.TrainType:IRIshikawa.Rapid':
        return rapid;
      case 'odpt.TrainType:IRIshikawa.LimitedExpress':
        return limitedExpress;
      default:
        return unknown;
    }
  }
}

class Train {
  const Train({
    required this.id,
    required this.destination,
    required this.type,
    required this.delay,
  });

  final String id;
  final Station destination;
  final TrainType type;
  final String delay;

  bool get isDelayed => delay != '0';
}
