part of 'book_appointment_cubit.dart';

@immutable
sealed class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}
final class BookAppointmentSuccess extends BookAppointmentState {
  BookAppointmentSuccess({required this.finalData});
  List<String> finalData;
}
final class BookAppointmentLoading extends BookAppointmentState {}
final class BookAppointmentFailure extends BookAppointmentState {
  BookAppointmentFailure({required this.message});
  String message;
}
