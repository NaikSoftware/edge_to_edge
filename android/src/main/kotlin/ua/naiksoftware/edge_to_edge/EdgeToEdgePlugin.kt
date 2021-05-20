package ua.naiksoftware.edge_to_edge

import android.app.Activity
import androidx.annotation.NonNull
import androidx.core.view.WindowCompat

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** EdgeToEdgePlugin */
class EdgeToEdgePlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private var navigationBarColor: Int = 0
    private var statusBarColor: Int = 0

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "edge_to_edge")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "setEnabled") {
            setEdgeToEdgeEnabled(call.arguments as Boolean)
            result.success(true)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    private fun setEdgeToEdgeEnabled(enabled: Boolean) {
        val window = activity?.window
        if (window != null) {
            WindowCompat.setDecorFitsSystemWindows(window, !enabled)
            if (enabled) {
                navigationBarColor = window.navigationBarColor
                statusBarColor = window.statusBarColor
                window.navigationBarColor = 0 //for transparent nav bar
                window.statusBarColor = 0 //for transparent status bar
            } else {
                if (navigationBarColor != 0) window.navigationBarColor =
                    navigationBarColor //restore previous color
                if (statusBarColor != 0) window.statusBarColor =
                    statusBarColor //restore previous color
            }
        }
    }
}
