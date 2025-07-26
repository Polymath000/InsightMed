sealed class EndPoint {
  static const String baseUrl = 'https://fast-recharge.online/public';
  static const String signIn = 'user/signin';
  static const String signUp = 'user/signup';
  static String getUserDataEndPoint(final String id) => 'user/get-user/$id';
}

sealed class ApiKey {
  static const String status = 'status';
  static const String errorMessage = 'ErrorMessage';
  static const String email = 'email';
  static const String password = 'password';
  static const String token = 'token';
  static const String message = 'message';
  static const String id = 'id';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String confirmPassword = 'confirmPassword';
  static const String location = 'location';
  static const String profilePic = 'profilePic';
}
