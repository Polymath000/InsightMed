import '../entities/ray_entity.dart';
import '../enums/x_ray_status_enum.dart';
import '../extensions/string_extension.dart';

class RayModel extends RayEntity {
  const RayModel({
    super.id,
    super.userId,
    super.imagePath,
    super.temperature,
    super.systolicBP,
    super.diastolicBP,
    super.heartRate,
    super.hasCough,
    super.canSmellTasteFood,
    super.hasHeadache,
    super.aiStatus,
    super.aiSummary,
    super.aiConfidence,
    super.createdAt,
    super.updatedAt,
  });

  factory RayModel.fromEntity(final RayEntity? entity) => RayModel(
    id: entity?.id,
    userId: entity?.userId,
    imagePath: entity?.imagePath,
    temperature: entity?.temperature,
    systolicBP: entity?.systolicBP,
    diastolicBP: entity?.diastolicBP,
    heartRate: entity?.heartRate,
    hasCough: entity?.hasCough,
    canSmellTasteFood: entity?.canSmellTasteFood,
    hasHeadache: entity?.hasHeadache,
    aiStatus: entity?.aiStatus,
    aiSummary: entity?.aiSummary,
    aiConfidence: entity?.aiConfidence,
    createdAt: entity?.createdAt,
    updatedAt: entity?.updatedAt,
  );

  factory RayModel.fromJson(final Map<String, dynamic>? json) => RayModel(
    id: json?['id'],
    userId: json?['user_id'],
    imagePath: json?['image'],
    temperature: json?['temperature'],
    systolicBP: json?['systolic_bp'],
    diastolicBP: json?['diastolic_bp'],
    heartRate: json?['heart_rate'],
    hasCough: json?['has_cough'],
    canSmellTasteFood: json?['can_smell_taste'],
    hasHeadache: json?['has_headaches'],
    aiStatus: (json?['ai_status'] as String?)?.toEnum(XRayStatusEnum.values),
    aiSummary: json?['ai_summary'],
    aiConfidence: json?['ai_confidence'],
    createdAt: (json?['created_at'] as String?)?.toDateTime(),
    updatedAt: (json?['updated_at'] as String?)?.toDateTime(),
  );

  RayEntity toEntity() => RayEntity(
    id: id,
    userId: userId,
    imagePath: imagePath,
    temperature: temperature,
    systolicBP: systolicBP,
    diastolicBP: diastolicBP,
    heartRate: heartRate,
    hasCough: hasCough,
    canSmellTasteFood: canSmellTasteFood,
    hasHeadache: hasHeadache,
    aiStatus: aiStatus,
    aiSummary: aiSummary,
    aiConfidence: aiConfidence,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'image': imagePath,
    'temperature': temperature,
    'systolic_bp': systolicBP,
    'diastolic_bp': diastolicBP,
    'heart_rate': heartRate,
    'has_cough': hasCough,
    'can_smell_taste': canSmellTasteFood,
    'has_headaches': hasHeadache,
    'ai_status': aiStatus?.name,
    'ai_summary': aiSummary,
    'ai_confidence': aiConfidence,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
