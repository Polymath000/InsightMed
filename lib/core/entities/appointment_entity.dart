base class AppointmentEntity {
  const AppointmentEntity({this.appointmentTime, this.status});
  final DateTime? appointmentTime;
  final String? status;

  bool get isValid => appointmentTime != null;
}
