import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inno_plugin/inno_plugin.dart';

class ClasicPluginScreen extends StatefulWidget {
  const ClasicPluginScreen({Key? key}) : super(key: key);

  @override
  State<ClasicPluginScreen> createState() => _ClasicPluginScreenState();
}

class _ClasicPluginScreenState extends State<ClasicPluginScreen> {
  String _platformVersion = 'Unknown';
  final _innoPlugin = InnoPlugin();

  Future<void> getPlatformVersion() async {
    String platformVersion;
    try {
      platformVersion =
          await _innoPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Classic plugin'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Platform version: $_platformVersion'),
            TextButton(
              onPressed: getPlatformVersion,
              child: const Text('Get platform version'),
            ),
          ],
        ),
      ),
    );
  }
}
