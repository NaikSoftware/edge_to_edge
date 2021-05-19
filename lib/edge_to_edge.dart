
import 'dart:async';

import 'package:flutter/services.dart';

class EdgeToEdge {
  static const MethodChannel _channel =
      const MethodChannel('edge_to_edge');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
