import 'package:pigeon/pigeon.dart';

class SquareEquationResult {
  double? x1;
  double? x2;
}

class SquareEquationParams {
  double a;
  double b;
  double c;

  SquareEquationParams({
    required this.a,
    required this.b,
    required this.c,
  });
}

@HostApi()
abstract class PigeonInnoPlugin {
  @async
  SquareEquationResult solveSqueareEquation(SquareEquationParams params);
}
