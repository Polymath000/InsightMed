import '../entities/appointment_entity.dart';
import '../extensions/string_extension.dart';

final class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({super.appointmentTime, super.status});

  factory AppointmentModel.fromEntity(final AppointmentEntity entity) =>
      AppointmentModel(
        appointmentTime: entity.appointmentTime,
        status: entity.status,
      );

  factory AppointmentModel.fromJson(final Map<String, dynamic>? json) =>
      AppointmentModel(
        appointmentTime: (json?['appointment_time'] as String?)?.toDateTime(),
        status: json?['status'],
      );

  AppointmentEntity toEntity() =>
      AppointmentEntity(appointmentTime: appointmentTime, status: status);

  Map<String, dynamic> toJson() => {
    'appointment_time': appointmentTime?.toIso8601String(),
    'status': status,
  };
}
