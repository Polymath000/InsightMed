import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/enums/patient_enum.dart';
import '../../../../../core/repos/user_repo.dart';
import '../../../../../core/services/get_it_service.dart';

part 'get_patients_state.dart';

class GetPatientsCubit extends Cubit<GetPatientsState> {
  GetPatientsCubit() : super(const GetPatientsInitial()) {
    unawaited(getPatients());
  }

  PatientStatusEnum? selectedStatus;

  final List<UserEntity> allPatients = List<UserEntity>.empty(growable: true);
  final List<UserEntity> filteredPatients = List<UserEntity>.empty(
    growable: true,
  );

  Future<void> getPatients() async {
    emit(const GetPatientsLoading());
    try {
      final users = await getIt<UserRepo>().getPatientsFromApi();
      final allPatients = users
        ..sort(
          (final a, final b) =>
              b.updatedAt?.compareTo(a.updatedAt ?? DateTime.now()) ?? 0,
        );
      this.allPatients.addAll(allPatients);
      filteredPatients.addAll(allPatients);
      if (!isClosed) {
        emit(GetPatientsSuccess());
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(GetPatientsFailure(e.toString()));
    }
  }

  void filterByStatus(final PatientStatusEnum? e) {
    selectedStatus = e;
    if (selectedStatus == null) {
      filteredPatients
        ..clear()
        ..addAll(allPatients);
      return emit(GetPatientsSuccess());
    }
    filteredPatients
      ..clear()
      ..addAll(allPatients.where((final patient) => patient.status == e));
    return emit(GetPatientsSuccess());
  }
}
