import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edge_to_edge/edge_to_edge.dart';

void main() {
  const MethodChannel channel = MethodChannel('edge_to_edge');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await EdgeToEdge.platformVersion, '42');
  });
}
