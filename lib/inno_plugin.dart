import 'inno_plugin_platform_interface.dart';

class InnoPlugin {
  Future<String?> getPlatformVersion() {
    return InnoPluginPlatform.instance.getPlatformVersion();
  }
}
