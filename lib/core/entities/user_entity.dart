import '../enums/patient_enum.dart';
import 'ray_entity.dart';

class UserEntity {
  const UserEntity({
    this.id,
    this.token,
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.gender,
    this.age,
    this.phoneNumber,
    this.role,
    this.medicalCondition,
    this.specialty,
    this.createdAt,
    this.updatedAt,
    this.statuses,
    this.rays,
  });
  final int? id;
  final String? token;
  final String? name;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final String? gender;
  final String? age;
  final String? phoneNumber;
  final String? role;
  final String? medicalCondition;
  final String? specialty;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PatientStatusEnum? statuses;
  final List<RayEntity>? rays;

  UserEntity copyWith({
    final int? id,
    final String? token,
    final String? name,
    final String? email,
    final String? password,
    final String? passwordConfirmation,
    final String? gender,
    final String? age,
    final String? phoneNumber,
    final String? role,
    final String? medicalCondition,
    final String? specialty,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final PatientStatusEnum? statuses,
    final List<RayEntity>? rays,
  }) => UserEntity(
    id: id ?? this.id,
    token: token ?? this.token,
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    gender: gender ?? this.gender,
    age: age ?? this.age,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    role: role ?? this.role,
    medicalCondition: medicalCondition ?? this.medicalCondition,
    specialty: specialty ?? this.specialty,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    statuses: statuses ?? this.statuses,
    rays: rays ?? this.rays,
  );

  bool isDoctor() => role == 'doctor';
  bool isPatient() => !isDoctor();
}
