part of 'book_appointment_cubit.dart';

@immutable
sealed class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}

final class GetAppointmentSuccess extends BookAppointmentState {
  GetAppointmentSuccess({required this.finalData});
  final List<String> finalData;
}

final class BookAppointmentSuccess extends BookAppointmentState {}

final class DeleteAppointmentSuccess extends BookAppointmentState {}

final class DeleteAppointmentFailure extends BookAppointmentState {
  DeleteAppointmentFailure({required this.message});
  final String message;
}

final class BookAppointmentLoading extends BookAppointmentState {}

final class BookAppointmentFailure extends BookAppointmentState {
  BookAppointmentFailure({required this.message});
  final String message;
}

class AppointmentAlreadyBooked extends BookAppointmentState {}
