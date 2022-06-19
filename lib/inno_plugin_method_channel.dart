import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'inno_plugin_platform_interface.dart';

class MethodChannelInnoPlugin extends InnoPluginPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('inno_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
