import 'dart:async';
import 'dart:developer';

import 'package:edge_to_edge/edge_to_edge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _enabled = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _toggleEdgeToEdge() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      await EdgeToEdge.enable(!_enabled, SystemUiOverlayStyle.dark);
      setState(() {
        _enabled = !_enabled;
      });
    } on PlatformException catch (e, trace) {
      log('Set enabled error', error: e, stackTrace: trace);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _toggleEdgeToEdge(),
            child: Text(_enabled ? 'Disable' : 'Enable'),
          ),
        ),
      ),
    );
  }
}
