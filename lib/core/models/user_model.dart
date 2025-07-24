class UserModel {
  UserModel({
    required this.password,

    required this.name,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
    name: json['name'],
    email: json['email'],
    password: json['password'],
    role: json['role'],
  );

  String? name;
  String? email;
  String? password;
  String? role;
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'role': role,
  };
}
