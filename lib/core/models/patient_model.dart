import 'user_model.dart';

class PatientModel extends UserModel {
  PatientModel({
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required super.password,
    required super.name,
    required super.email,
    this.role = "default: patient",
  });

  factory PatientModel.fromJson(final Map<String, dynamic> json) =>
      PatientModel(
        age: json['age'],
        email: json['email'],
        gender: json['gender'],
        phoneNumber: json['phone_number'],
        password: json['password'],
        name: json['name'],
        role: json['role'],
      );
  String gender;
  String phoneNumber;
  String age;
  String role;
  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'age': age,
    'phoneNumber': phoneNumber,
    'gender': gender,
    'role': 'default: patient',
  };
}
