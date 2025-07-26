import '../entities/user_entity.dart';

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
    super.specialty,
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
    specialty: entity.specialty,
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
    specialty: json['specialty'],
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
    specialty: specialty,
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
    'specialty': specialty,
  };
}
