import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inno_plugin/pigeon/pigeon.dart';

class PigeonPluginScreen extends StatefulWidget {
  const PigeonPluginScreen({Key? key}) : super(key: key);

  @override
  State<PigeonPluginScreen> createState() => _PigeonPluginScreenState();
}

class _PigeonPluginScreenState extends State<PigeonPluginScreen> {
  SquareEquationResult? _result;

  final _pigeonPlugin = PigeonInnoPlugin();
  final _aEditingController = TextEditingController(text: '1');
  final _bEditingController = TextEditingController(text: '1');
  final _cEditingController = TextEditingController(text: '1');

  Future<void> solveEq() async {
    SquareEquationResult? result;
    try {
      final a = double.parse(_aEditingController.text),
          b = double.parse(_bEditingController.text),
          c = double.parse(_cEditingController.text);

      result = await _pigeonPlugin.solveSqueareEquation(
        SquareEquationParams(a: a, b: b, c: c),
      );
    } on PlatformException {}

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
        title: const Text('Pigeon plugin'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Square Equation',
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
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _cEditingController,
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: solveEq,
              child: const Text('Solve'),
            ),
            const SizedBox(height: 32),
            if (result != null) Text('x1 = ${result.x1}, x2 = ${result.x2}')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aEditingController.dispose();
    _bEditingController.dispose();
    _cEditingController.dispose();
    super.dispose();
  }
}
