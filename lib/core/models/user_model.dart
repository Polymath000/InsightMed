import '../entities/ray_entity.dart';
import '../entities/user_entity.dart';
import '../enums/patient_enum.dart' show PatientStatusEnum;
import '../extensions/string_extension.dart';
import '../helpers/list_handler.dart';
import 'ray_model.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.token,
    super.name,
    super.email,
    super.password,
    super.passwordConfirmation,
    super.gender,
    super.age,
    super.phoneNumber,
    super.role,
    super.medicalCondition,
    super.specialty,
    super.createdAt,
    super.updatedAt,
    super.statuses,
    super.rays,
  });

  factory UserModel.fromEntity(final UserEntity entity) => UserModel(
    id: entity.id,
    token: entity.token,
    name: entity.name,
    email: entity.email,
    password: entity.password,
    passwordConfirmation: entity.passwordConfirmation,
    gender: entity.gender,
    age: entity.age,
    phoneNumber: entity.phoneNumber,
    role: entity.role,
    medicalCondition: entity.medicalCondition,
    specialty: entity.specialty,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    statuses: entity.statuses,
    rays: entity.rays,
  );

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
    id: json['id'],
    token: json['token'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
    passwordConfirmation: json['password_confirmation'],
    gender: json['gender'],
    age: json['age'],
    phoneNumber: json['phone_number'],
    role: json['role'],
    medicalCondition: json['medical_condition'],
    specialty: json['specialty'],
    createdAt: (json['created_at'] as String?)?.toDateTime(),
    updatedAt: (json['updated_at'] as String?)?.toDateTime(),
    statuses: (json['status'] as String?)?.toEnum<PatientStatusEnum>(
      PatientStatusEnum.values,
    ),
    rays: ListHandler.parseComplex<RayEntity>(json['rays'], RayModel.fromJson),
  );

  UserEntity toEntity() => UserEntity(
    id: id,
    token: token,
    name: name,
    email: email,
    password: password,
    passwordConfirmation: passwordConfirmation,
    gender: gender,
    age: age,
    phoneNumber: phoneNumber,
    role: role,
    medicalCondition: medicalCondition,
    specialty: specialty,
    createdAt: createdAt,
    updatedAt: updatedAt,
    statuses: statuses,
    rays: rays,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'gender': gender,
    'age': age,
    'phone_number': phoneNumber,
    'role': role,
    'medical_condition': medicalCondition,
    'specialty': specialty,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'statuses': statuses?.name,
    'rays': ListHandler.encodeComplex<RayEntity>(
      rays,
      (final ray) => RayModel.fromEntity(ray).toJson(),
    ),
  };
}
