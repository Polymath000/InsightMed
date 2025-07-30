part of 'get_appiontment_cubit.dart';

@immutable
sealed class GetAppiontmentState {
  const GetAppiontmentState();
}

final class GetAppiontmentInitial extends GetAppiontmentState {
  const GetAppiontmentInitial();
}

final class GetAppiontmentLoading extends GetAppiontmentState {
  const GetAppiontmentLoading();
}

final class GetAppiontmentFailure extends GetAppiontmentState {
  const GetAppiontmentFailure({required this.message});
  final String message;
}

final class GetAppointmentSuccess extends GetAppiontmentState {
  const GetAppointmentSuccess({required this.appointments});
  final List<AppointmentEntity> appointments;
}
