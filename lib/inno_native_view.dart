import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// This is used in the platform side to register the view.
const String _viewType = 'inno_plugin.view';

class InnoNativeView extends StatelessWidget {
  const InnoNativeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AndroidView(
      viewType: _viewType,
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
