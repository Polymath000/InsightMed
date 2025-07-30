import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/appointment_entity.dart';
import '../../../../../core/repos/appointment_repo.dart';
import '../../../../../core/services/get_it_service.dart';

part 'get_appiontment_state.dart';

class GetAppiontmentCubit extends Cubit<GetAppiontmentState> {
  GetAppiontmentCubit(this.email) : super(const GetAppiontmentInitial()) {
    unawaited(getPatientAppiontment());
  }
  final String email;

  Future<void> getPatientAppiontment() async {
    emit(const GetAppiontmentLoading());
    try {
      final appointments = await getIt<AppointmentRepo>().getPatientAppiontment(
        email,
      );
      if (!isClosed) {
        emit(
          GetAppointmentSuccess(appointments: appointments.reversed.toList()),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        emit(const GetAppointmentSuccess(appointments: []));
      } else {
        emit(GetAppiontmentFailure(message: e.toString()));
      }
    } on Exception catch (e) {
      emit(GetAppiontmentFailure(message: e.toString()));
    }
  }
}
