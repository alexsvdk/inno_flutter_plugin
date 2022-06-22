import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:inno_plugin/ffi/generated_bindings.dart';

class FFIScreen extends StatefulWidget {
  const FFIScreen({Key? key}) : super(key: key);

  @override
  State<FFIScreen> createState() => _FFIScreenState();
}

class _FFIScreenState extends State<FFIScreen> {
  final _nativeLib = NativeLibrary(
    DynamicLibrary.open('libffi.so'),
  );
  final _aEditingController = TextEditingController(text: '1');
  final _bEditingController = TextEditingController(text: '1');
  int? _result;

  void _solveSum() {
    int result;
    final a = int.parse(_aEditingController.text),
        b = int.parse(_bEditingController.text);

    result = _nativeLib.sum(a, b);

    if (!mounted) return;

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = _result;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('FFI'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sum',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const SizedBox(width: 32),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _aEditingController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _bEditingController,
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: _solveSum,
              child: const Text('Solve'),
            ),
            const SizedBox(height: 32),
            if (result != null) Text('Sum is $result')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aEditingController.dispose();
    _bEditingController.dispose();
    super.dispose();
  }
}
