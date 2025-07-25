import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.password,
    super.name,
    super.email,
    super.role,
    super.specialty,
    super.age,
    super.gender,
    super.passwordConfirmation,
    super.phoneNumber,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
    name: json['name'],
    email: json['email'],
    password: json['password'],
    role: json['role'],
    specialty: json['specialty'],
    age: json['age'],
    gender: json['gender'],
    passwordConfirmation: json['password_confirmation'],
    phoneNumber: json['phone_number'],
  );

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'role': role,
    'specialty': specialty,
    'age': age,
    'gender': gender,
    'password_confirmation': passwordConfirmation,
    'phone_number': phoneNumber,
  };

  factory UserModel.fromEntity(final UserEntity entity) => UserModel(
    name: entity.name,
    email: entity.email,
    password: entity.password,
    role: entity.role,
    specialty: entity.specialty,
    age: entity.age,
    gender: entity.gender,
    passwordConfirmation: entity.passwordConfirmation,
    phoneNumber: entity.phoneNumber,
  );

  @override
  UserEntity toEntity() => UserEntity(
    name: name,
    email: email,
    password: password,
    role: role,
    specialty: specialty,
    age: age,
    gender: gender,
    passwordConfirmation: passwordConfirmation,
    phoneNumber: phoneNumber,
  );
}
