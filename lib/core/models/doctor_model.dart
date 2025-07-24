import 'user_model.dart';

class DoctorModel extends UserModel {
  DoctorModel({
    required this.specialization,
    required this.avatar,
    required super.password,
    required super.name,
    required super.email,
  });

  factory DoctorModel.fromJson(final Map<String, dynamic> json) => DoctorModel(
    specialization: json['Specialization'],
    avatar: json['avatar'],
    password: json['password'],
    name: json['name'],
    email: json['email'],
  );

  final String specialization;
  final String avatar;

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,

    'Specialization': specialization,
    'avatar': avatar,
  };
}
