import 'user_model.dart';

class PatientModel extends UserModel {
  PatientModel({
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required super.password,
    required super.name,
    required super.email,
    String? passwordConfirmation,
  }) : passwordConfirmation = passwordConfirmation ?? password;

  factory PatientModel.fromJson(final Map<String, dynamic> json) =>
      PatientModel(
        age: json['age'],
        email: json['email'],
        gender: json['gender'],
        phoneNumber: json['phone_number'],
        password: json['password'],
        name: json['name'],
        // passwordConfirmation: json['password_confirmation'],
      );
  String gender;
  String phoneNumber;
  String age;
  String? passwordConfirmation;
  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'age': age,
    'phone_number': phoneNumber,
    'gender': gender,
  };
}
