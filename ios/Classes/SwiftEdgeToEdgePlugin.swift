import Flutter
import UIKit

public class SwiftEdgeToEdgePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "edge_to_edge", binaryMessenger: registrar.messenger())
    let instance = SwiftEdgeToEdgePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(true) // do nothing
  }
}
