import '../enums/patient_enum.dart';

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
    this.specialty,
    this.lastVisit,
    this.status,
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
  final String? specialty;
  final DateTime? lastVisit;
  final PatientStatusEnum? status;

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
    final String? specialty,
    final DateTime? lastVisit,
    final PatientStatusEnum? status,
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
    specialty: specialty ?? this.specialty,
    lastVisit: lastVisit ?? this.lastVisit,
    status: status ?? this.status,
  );

  bool isDoctor() => role == 'doctor';
}
