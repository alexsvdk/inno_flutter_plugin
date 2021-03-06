package com.example.inno_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** InnoPlugin */
class InnoPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        //classic
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "inno_plugin")
        channel.setMethodCallHandler(this)

        //pigeon
        val pigeonInnoPluginImpl = PigeonInnoPluginImpl()
        Pigeon.PigeonInnoPlugin.setup(flutterPluginBinding.binaryMessenger, pigeonInnoPluginImpl)

        //view
        flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory("inno_plugin.view", InnoNativeViewFactory())
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
