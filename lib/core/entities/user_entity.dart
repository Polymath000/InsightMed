class UserEntity {
  const UserEntity({
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
  });

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

  UserEntity copyWith({
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
  }) => UserEntity(
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
  );

  bool isDoctor() => role == 'patient';
}
