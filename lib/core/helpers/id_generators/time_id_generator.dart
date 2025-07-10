import 'package:flutter/foundation.dart' show immutable;

import '../../extensions/string_extension.dart' show StringExtension;

@immutable
final class TimeIdGenerator {
  const TimeIdGenerator();
  String generateId() {
    final reversedMicroseconds = DateTime.now().microsecondsSinceEpoch
        .toString()
        .reversed;
    final checksum = _calculateChecksum(reversedMicroseconds);
    final combinedValue = BigInt.parse(reversedMicroseconds + checksum);
    return combinedValue.toRadixString(36).toUpperCase();
  }

  String _calculateChecksum(final String orderId) {
    final digits = orderId.split('').map(int.parse).toList(growable: false);
    var sum = 0;
    for (var i = 0; i < digits.length; i++) {
      sum += digits[i] * (i.isEven ? 3 : 7);
    }
    return (10 - (sum % 10)).toString();
  }
}
