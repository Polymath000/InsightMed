class UserModel {
  UserModel({required this.password, required this.name, required this.email});

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );

  String name;
  String email;
  String? password;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}
