import '../entities/ray_entity.dart';

class RayModel extends RayEntity {
  const RayModel({
    super.image,
    super.temperature,
    super.systolicBP,
    super.diastolicBP,
    super.heartRate,
    super.hasCough,
    super.canSmellTasteFood,
    super.hasHeadache,
  });

  factory RayModel.fromEntity(final RayEntity entity) => RayModel(
    image: entity.image,
    temperature: entity.temperature,
    systolicBP: entity.systolicBP,
    diastolicBP: entity.diastolicBP,
    heartRate: entity.heartRate,
    hasCough: entity.hasCough,
    canSmellTasteFood: entity.canSmellTasteFood,
    hasHeadache: entity.hasHeadache,
  );

  factory RayModel.fromJson(final Map<String, dynamic> json) => RayModel(
    image: json['image'],
    temperature: json['temperature'],
    systolicBP: json['systolic_bp'],
    diastolicBP: json['diastolic_bp'],
    heartRate: json['heart_rate'],
    hasCough: json['has_cough'],
    canSmellTasteFood: json['can_smell_taste'],
    hasHeadache: json['has_headaches'],
  );

  RayEntity toEntity() => RayEntity(
    image: image,
    temperature: temperature,
    systolicBP: systolicBP,
    diastolicBP: diastolicBP,
    heartRate: heartRate,
    hasCough: hasCough,
    canSmellTasteFood: canSmellTasteFood,
    hasHeadache: hasHeadache,
  );

  Map<String, dynamic> toJson() => {
    'image': image,
    'temperature': temperature,
    'systolic_bp': systolicBP,
    'diastolic_bp': diastolicBP,
    'heart_rate': heartRate,
    'has_cough': hasCough,
    'can_smell_taste': canSmellTasteFood,
    'has_headaches': hasHeadache,
  };
}
