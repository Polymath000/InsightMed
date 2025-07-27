part of 'get_patients_cubit.dart';

@immutable
sealed class GetPatientsState {
  const GetPatientsState();
}

final class GetPatientsInitial extends GetPatientsState {
  const GetPatientsInitial();
}

final class GetPatientsLoading extends GetPatientsState {
  const GetPatientsLoading();
}

final class GetPatientsSuccess extends GetPatientsState {}

final class GetPatientsFailure extends GetPatientsState {
  const GetPatientsFailure(this.message);
  final String message;
}
