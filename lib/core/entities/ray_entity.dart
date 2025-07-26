class RayEntity {
  const RayEntity({
    this.image,
    this.temperature,
    this.systolicBP,
    this.diastolicBP,
    this.heartRate,
    this.hasCough,
    this.canSmellTasteFood,
    this.hasHeadache,
  });

  final String? image;
  final String? temperature;
  final String? systolicBP;
  final String? diastolicBP;
  final String? heartRate;
  final String? hasCough;
  final String? canSmellTasteFood;
  final String? hasHeadache;

  RayEntity copyWith({
    final String? image,
    final String? temperature,
    final String? systolicBP,
    final String? diastolicBP,
    final String? heartRate,
    final String? hasCough,
    final String? canSmellTasteFood,
    final String? hasHeadache,
  }) => RayEntity(
    image: image ?? this.image,
    temperature: temperature ?? this.temperature,
    systolicBP: systolicBP ?? this.systolicBP,
    diastolicBP: diastolicBP ?? this.diastolicBP,
    heartRate: heartRate ?? this.heartRate,
    hasCough: hasCough ?? this.hasCough,
    canSmellTasteFood: canSmellTasteFood ?? this.canSmellTasteFood,
    hasHeadache: hasHeadache ?? this.hasHeadache,
  );
}
