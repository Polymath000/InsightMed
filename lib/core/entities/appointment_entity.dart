base class AppointmentEntity {
  const AppointmentEntity({this.appointmentTime});
  final DateTime? appointmentTime;

  bool get isValid => appointmentTime != null;
}
