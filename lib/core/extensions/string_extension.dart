extension StringExtension on String {
  /// Capitalizes the first letter
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  /// Reverses the string
  String get reversed => split('').reversed.join();

  /// Converts string to enum
  T? toEnum<T extends Enum?>(
    final List<T?>? values, [
    final Map<T, dynamic>? map,
  ]) => values?.firstWhere(
    (final e) => e?.name == this || e?.toString() == this || map?[e] == this,
    orElse: () => throw ArgumentError(
      'No enum value found for $this in '
      '${values.map((final e) => e?.name).join(', ')}',
    ),
  );
}
