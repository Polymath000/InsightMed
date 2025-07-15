 
 class UserModel {

  UserModel({
    required this.password, 
    required this.name,
    required this.email,
    required this.isDoctor,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'], 
      isDoctor: json['isDoctor'],
    );

  final String name;
  final String email;
  final String? password;
  final bool isDoctor ;

  Map<String, dynamic> toJson() => {
      'name': name,
      'email': email,
      'password': password,
    };
}