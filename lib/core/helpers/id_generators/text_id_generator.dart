import 'dart:convert' show utf8;

import 'package:flutter/foundation.dart' show immutable;

@immutable
final class TextIdGenerator {
  const TextIdGenerator(this._text);
  final String _text;
  String generateId() => _toBase62(
    utf8
        .encode(_text)
        .fold<BigInt>(
          BigInt.zero,
          (final previous, final element) =>
              (previous << 8) + BigInt.from(element),
        ),
  );

  String _toBase62(final BigInt number) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    var result = '';
    var localNumber = number;
    final bigInt62 = BigInt.from(62);
    while (localNumber > BigInt.zero) {
      result = chars[(localNumber % bigInt62).toInt()] + result;
      localNumber = localNumber ~/ bigInt62;
    }
    return result;
  }
}
