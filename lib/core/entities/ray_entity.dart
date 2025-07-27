import '../enums/x_ray_status_enum.dart';

class RayEntity {
  const RayEntity({
    this.id,
    this.userId,
    this.imagePath,
    this.temperature,
    this.systolicBP,
    this.diastolicBP,
    this.heartRate,
    this.hasCough,
    this.canSmellTasteFood,
    this.hasHeadache,
    this.aiStatus,
    this.aiSummary,
    this.aiConfidence,
    this.createdAt,
    this.updatedAt,
  });
  final int? id;
  final String? userId;
  final String? imagePath;
  final String? temperature;
  final String? systolicBP;
  final String? diastolicBP;
  final String? heartRate;
  final bool? hasCough;
  final bool? canSmellTasteFood;
  final bool? hasHeadache;
  final XRayStatusEnum? aiStatus;
  final String? aiSummary;
  final String? aiConfidence;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RayEntity copyWith({
    final int? id,
    final String? userId,
    final String? imagePath,
    final String? temperature,
    final String? systolicBP,
    final String? diastolicBP,
    final String? heartRate,
    final bool? hasCough,
    final bool? canSmellTasteFood,
    final bool? hasHeadache,
    final XRayStatusEnum? aiStatus,
    final String? aiSummary,
    final String? aiConfidence,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) => RayEntity(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    imagePath: imagePath ?? this.imagePath,
    temperature: temperature ?? this.temperature,
    systolicBP: systolicBP ?? this.systolicBP,
    diastolicBP: diastolicBP ?? this.diastolicBP,
    heartRate: heartRate ?? this.heartRate,
    hasCough: hasCough ?? this.hasCough,
    canSmellTasteFood: canSmellTasteFood ?? this.canSmellTasteFood,
    hasHeadache: hasHeadache ?? this.hasHeadache,
    aiStatus: aiStatus ?? this.aiStatus,
    aiSummary: aiSummary ?? this.aiSummary,
    aiConfidence: aiConfidence ?? this.aiConfidence,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
