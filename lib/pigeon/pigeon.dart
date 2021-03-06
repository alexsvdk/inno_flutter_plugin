// Autogenerated from Pigeon (v3.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class SquareEquationResult {
  SquareEquationResult({
    this.x1,
    this.x2,
  });

  double? x1;
  double? x2;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['x1'] = x1;
    pigeonMap['x2'] = x2;
    return pigeonMap;
  }

  static SquareEquationResult decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SquareEquationResult(
      x1: pigeonMap['x1'] as double?,
      x2: pigeonMap['x2'] as double?,
    );
  }
}

class SquareEquationParams {
  SquareEquationParams({
    required this.a,
    required this.b,
    required this.c,
  });

  double a;
  double b;
  double c;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['a'] = a;
    pigeonMap['b'] = b;
    pigeonMap['c'] = c;
    return pigeonMap;
  }

  static SquareEquationParams decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SquareEquationParams(
      a: pigeonMap['a']! as double,
      b: pigeonMap['b']! as double,
      c: pigeonMap['c']! as double,
    );
  }
}

class _PigeonInnoPluginCodec extends StandardMessageCodec {
  const _PigeonInnoPluginCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SquareEquationParams) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is SquareEquationResult) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return SquareEquationParams.decode(readValue(buffer)!);
      
      case 129:       
        return SquareEquationResult.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class PigeonInnoPlugin {
  /// Constructor for [PigeonInnoPlugin].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PigeonInnoPlugin({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _PigeonInnoPluginCodec();

  Future<SquareEquationResult> solveSqueareEquation(SquareEquationParams arg_params) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PigeonInnoPlugin.solveSqueareEquation', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_params]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as SquareEquationResult?)!;
    }
  }
}
