part of 'profile_of_patient_cubit.dart';

@immutable
sealed class ProfileOfPatientState {}

final class ProfileOfPatientInitial extends ProfileOfPatientState {}

final class ProfileOfPatientSuccess extends ProfileOfPatientState {
  final UserEntity user;
  ProfileOfPatientSuccess({required this.user});
}

final class ProfileOfPatientLoading extends ProfileOfPatientState {}

final class ProfileOfPatientFailure extends ProfileOfPatientState {
  final String message;
  ProfileOfPatientFailure({required this.message});
}
