import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'inno_plugin_method_channel.dart';

abstract class InnoPluginPlatform extends PlatformInterface {
  InnoPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static InnoPluginPlatform _instance = MethodChannelInnoPlugin();

  /// The default instance of [InnoPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelInnoPlugin].
  static InnoPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InnoPluginPlatform] when
  /// they register themselves.
  static set instance(InnoPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
