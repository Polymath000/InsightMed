import 'user_model.dart';

class DoctorModel extends UserModel {
  DoctorModel({
    required this.Specialization,
    required this.avatar,
    required super.password,
    required super.name,
    required super.email,
  });

  factory DoctorModel.fromJson(final Map<String, dynamic> json) => DoctorModel(
    Specialization: json['Specialization'],
    avatar: json['avatar'],
    password: json['password'],
    name: json['name'],
    email: json['email'],
  );

  final String Specialization;
  final String avatar;

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,

    'Specialization': Specialization,
    'avatar': avatar,
  };
}
