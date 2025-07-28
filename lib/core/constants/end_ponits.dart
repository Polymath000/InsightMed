sealed class EndPoint {
  const EndPoint();
  static const String baseUrl = 'https://fast-recharge.online/api';

  static const String addRegister = '/register';
  static const String addLogin = '/login';
  static const String addLogout = '/logout';
  static const String addForgotPassword = '/forgot-password';
  static const String addVerifyResetCode = '/verify-reset-code';
  static const String addResetPasswordView = '/reset-password';

  static const String getDashboard = '/dashboard';

  static const String addRays = '/rays';
  static const String getRays = '/rays';

  static const String addAppointments = '/appointments';
  static const String getAppointments = '/appointments/available';
  static const String getUserAppointments = '/appointments/my';

  static const String updateUser = '/me';
  static const String getUser = '/me';

  static const String getDoctors = '/doctors';
  static const String getPatients = '/doctor/patients';
  static const String addPatientsStatus = '/doctor/patients/status';

  static const String addNotes = '/doctor/notes';
  static String updateNotes(final int noteId) => '/doctor/notes/$noteId';
  static String deleteNotes(final int noteId) => '/doctor/notes/$noteId';
  static String getNotes(final int patientId) =>
      '/doctor/patients/$patientId/notes';

  static String getAIRays(final String id) => '/doctor/rays/{$id}/ai';
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
