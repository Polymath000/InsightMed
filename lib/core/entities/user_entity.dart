class UserEntity {
  const UserEntity({
    this.phoneNumber,
    this.passwordConfirmation,
    this.password,
    this.name,
    this.email,
    this.role,
    this.specialty,
    this.age,
    this.gender,
  });
  final String? specialty;
  final String? name;
  final String? email;
  final String? password;
  final String? role;
  final String? gender;
  final String? phoneNumber;
  final String? age;
  final String? passwordConfirmation;

  String? get getSpecialty => specialty;
  String? get getName => name;
  String? get getEmail => email;
  String? get getPassword => password;
  String? get getRole => role;
  String? get getGender => gender;
  String? get getPhoneNumber => phoneNumber;
  String? get getAge => age;
  String? get getPasswordConfirmation => passwordConfirmation;

  bool isDoctor() => role == 'patient';

  UserEntity copyWith({
    String? name,
    String? email,
    String? password,
    String? role,
    String? gender,
    String? phoneNumber,
    String? age,
    String? passwordConfirmation,
    String? specialty,
  }) => UserEntity(
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    gender: gender ?? this.gender,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    age: age ?? this.age,
    passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    specialty: specialty ?? this.specialty,
  );
}
