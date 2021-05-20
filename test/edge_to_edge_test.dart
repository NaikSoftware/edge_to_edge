import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edge_to_edge/edge_to_edge.dart';

void main() {
  const MethodChannel channel = MethodChannel('edge_to_edge');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log('Set enabled ${methodCall.arguments}');
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('setEnabled', () async {
    await EdgeToEdge.enable(true, SystemUiOverlayStyle.dark);
  });
}
