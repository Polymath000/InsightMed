import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
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
      final users = await getIt<UserRepo>().getPatientsFromApi();
      final allPatients = users
        ..sort(
          (final a, final b) =>
              b.updatedAt?.compareTo(a.updatedAt ?? DateTime.now()) ?? 0,
        );
      if (!isClosed) {
        emit(GetPatientsSuccess(allPatients));
      }
    } on DioException catch (e) {
      String message = "there was an error , please try again later";
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        message =
            'Oops! Something went wrong with the network. '
            'Please check your connection and try again.';
      }
      emit(GetPatientsFailure(message));
    } on Exception catch (e) {
      log(e.toString());
      emit(const GetPatientsFailure('There was an error , please try again later'));
    }
  }
}
