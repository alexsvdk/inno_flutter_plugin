import 'package:flutter/material.dart';
import 'package:inno_plugin/inno_native_view.dart';

class ViewPluginPage extends StatelessWidget {
  const ViewPluginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Native view plugin'),
      ),
      body: const InnoNativeView(),
    );
  }
}
