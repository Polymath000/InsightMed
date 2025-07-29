sealed class EndPoint {
  const EndPoint();
  static const String _baseUrl = 'https://fast-recharge.online';
  static const String apiUrl = '$_baseUrl/api';
  static const String storageUrl = '$_baseUrl/storage';

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
  static const String getAvailableAppointments = '/appointments/available';
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
