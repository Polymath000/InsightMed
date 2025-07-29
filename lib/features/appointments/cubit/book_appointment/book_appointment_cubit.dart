import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/get_user.dart';
import '../../../../core/services/dio/auth_dio.dart';
import '../../../../core/services/shared_preferences_singleton.dart';

part 'book_appointment_state.dart';

const String appointmentIdKey = 'appointmentId';
const String isBookedKey = 'isBooked';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentInitial());
  late String message;
  Future<void> getAppiontments({required final String date}) async {
    emit(BookAppointmentLoading());
    try {
      final dioInstance = dio();
      final formattedDate = DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.parse(date));
      final response = await dioInstance.get(
        '/appointments/available',
        queryParameters: {'doctor_id': 5, 'date': formattedDate},
        options: Options(headers: _setHeaders()),
      );
      final Map<String, dynamic> jsonData = response.data;
      final data = List<String>.from(jsonData['data']);
      var finalData = List<String>.filled(data.length, '');
      for (var i = 0; i < data.length; i++) {
        finalData[i] = data[i].substring(11, 16);
      }
      if (!isClosed) {
        emit(GetAppointmentSuccess(finalData: finalData));
      }
    } on Exception catch (e) {
      emit(BookAppointmentFailure(message: e.toString()));
      log(e.toString());
    }
  }

  Future<void> bookAppointment({required final String appointment}) async {
    emit(BookAppointmentLoading());
    try {
      final dioInstance = dio();
      var response = await dioInstance.post(
        '/appointments',
        data: {'doctor_id': '5', 'appointment_time': appointment},
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${getUser!.token}',
          },
        ),
      );
      Map<String, dynamic> jsonData = response.data;
      final id = jsonData['data']['id'].toString();
      await SharedPreferencesSingleton.setString(appointmentIdKey, id);
      await SharedPreferencesSingleton.setBool(isBookedKey, true, value: true);
      if (!isClosed) {
        emit(BookAppointmentSuccess());
      }
    } on Exception catch (e) {
      emit(BookAppointmentFailure(message: e.toString()));
    }
  }

  Future<void> deleteAppointment({required final String id}) async {
    emit(BookAppointmentLoading());
    try {
      final dioInstance = dio();
      var response = await dioInstance.delete(
        '/appointments/$id',
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${getUser!.token}',
          },
        ),
      );
      await SharedPreferencesSingleton.remove(appointmentIdKey);
      await SharedPreferencesSingleton.setBool(
        isBookedKey,
        false,
        value: false,
      );
      if (!isClosed) {
        emit(DeleteAppointmentSuccess());
      }
    }on Exception catch (e) {
      emit(BookAppointmentFailure(message: e.toString()));
    }
  }
}

Map<String, String> _setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
