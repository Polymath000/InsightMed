import '../entities/appointment_entity.dart';
import '../extensions/string_extension.dart';

final class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({super.appointmentTime});

  factory AppointmentModel.fromEntity(final AppointmentEntity entity) =>
      AppointmentModel(appointmentTime: entity.appointmentTime);

  factory AppointmentModel.fromJson(final Map<String, dynamic> json) =>
      AppointmentModel(
        appointmentTime: (json['appointment_time'] as String?)?.toDateTime(),
      );

  AppointmentEntity toEntity() =>
      AppointmentEntity(appointmentTime: appointmentTime);

  Map<String, dynamic> toJson() => {
    'appointment_time': appointmentTime?.toIso8601String(),
  };
}
