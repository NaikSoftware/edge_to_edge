import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EdgeToEdge {
  static const MethodChannel _channel = const MethodChannel('edge_to_edge');

  static Future<void> enable(bool enabled, SystemUiOverlayStyle style) async {
    await _channel.invokeMethod('setEnabled', enabled);
    SystemChrome.setSystemUIOverlayStyle(enabled
        ? style.copyWith(
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent)
        : style);
  }
}
