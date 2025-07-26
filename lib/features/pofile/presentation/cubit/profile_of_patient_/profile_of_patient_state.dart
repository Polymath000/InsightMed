part of 'profile_of_patient_cubit.dart';

@immutable
sealed class ProfileOfPatientState {}

final class ProfileOfPatientInitial extends ProfileOfPatientState {}

final class ProfileOfPatientSuccess extends ProfileOfPatientState {
  ProfileOfPatientSuccess({required this.user});

  final UserEntity user;
}

final class ProfileOfPatientLoading extends ProfileOfPatientState {}

final class ProfileOfPatientFailure extends ProfileOfPatientState {
  ProfileOfPatientFailure({required this.message});
  final String message;
}
