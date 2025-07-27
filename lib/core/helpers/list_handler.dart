import 'package:flutter/foundation.dart' show immutable;

@immutable
sealed class ListHandler {
  const ListHandler();
  static List<T>? parseSimple<T>(final List<dynamic>? jsonList) =>
      jsonList?.whereType<T>().toList(growable: false);

  static List<T>? parseComplex<T>(
    final List<dynamic>? jsonList,
    final T Function(Map<String, dynamic>) fromJson,
  ) => jsonList
      ?.whereType<Map<String, dynamic>>()
      .map<T>(fromJson)
      .toList(growable: false);

  static List<Map<String, dynamic>>? encodeComplex<T>(
    final List<T>? entities,
    final Map<String, dynamic> Function(T) fromEntity,
  ) => entities?.map(fromEntity).toList(growable: false);
}
