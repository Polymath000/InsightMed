import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/repos/user_repo.dart';
import '../../../../../core/services/get_it_service.dart';

part 'get_patients_state.dart';

class GetPatientsCubit extends Cubit<GetPatientsState> {
  GetPatientsCubit() : super(const GetPatientsInitial()) {
    unawaited(getPatients());
  }

  Future<void> getPatients() async {
    emit(const GetPatientsLoading());
    try {
      final users = await getIt<UserRepo>().getDoctors();
      emit(GetPatientsSuccess(users));
    } on Exception catch (e) {
      log(e.toString());
      emit(GetPatientsFailure(e.toString()));
    }
  }
}
