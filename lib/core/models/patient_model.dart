import 'user_model.dart';

class PatientModel extends UserModel{
  final String medicalHistory;
  final String gender;
  final String phoneNumber;
  final int age;

  PatientModel({
    required this.medicalHistory,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required super.password,
    required super.name,
    required super.email,
    required super.isDoctor,
    }
    );

    factory PatientModel.fromJson(final Map<String, dynamic> json) => PatientModel(
      medicalHistory: json['medicalHistory'],
      age: json['age'],
      email: json['email'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      name: json['name'],
      isDoctor: json['isDoctor'],

      );


        Map<String, dynamic> toJson() => {
      'name': name,
      'email': email,
      'password': password,
      'isDoctor': isDoctor,
      'medicalHistory': medicalHistory,
      'age' : age,
      'phoneNumber': phoneNumber,
      'gender' : gender,
    };
  }
