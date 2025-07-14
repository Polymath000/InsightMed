import 'user_model.dart';

class DoctorModel extends UserModel {
  
  final String Specialization;
  final String avatar;

  DoctorModel({
    required this.Specialization,
    required this.avatar, 
    required super.password, 
    required super.name, 
    required super.email, 
    required super.isDoctor,
  });

  factory DoctorModel.fromJson(final Map<String, dynamic> json) => DoctorModel(
      Specialization: json['Specialization'],
      avatar: json['avatar'], 
      password: json['password'], 
      name: json['name'], 
      email: json['email'], 
      isDoctor: json['isDoctor'],
    );

  Map<String, dynamic> toJson() => {
      'name': name,
      'email': email,
      'password': password,
      'isDoctor': isDoctor,

      'Specialization': Specialization,
      'avatar': avatar,
    };
}