import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import '../../../../core/helpers/get_user.dart';
import '../../../../core/services/dio/auth_dio.dart';
import '../../../../core/services/shared_preferences_singleton.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentInitial());
  late String message;
  Future<List<String>> getAppiontments({required String date}) async {
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
      final List<String> data = List<String>.from(jsonData['data']);
      List<String> finalData = List<String>.filled(
        data.length,
        '',
        growable: false,
      );
      ;
      for (int i = 0; i < data.length; i++) {
        finalData[i] = data[i].substring(11, 16);
      }
      if (!isClosed) {
        emit(BookAppointmentSuccess(finalData: finalData));
      }
      return finalData;
    } catch (e) {
      emit(BookAppointmentFailure(message: e.toString()));
      log(e.toString());
      return [];
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
      //TODO: store in SharedPreferencesSingleton
      String id = jsonData['data']['id'];
      await SharedPreferencesSingleton.setString('appointmentId', id);
      List<String> finalData = [];
      // TODO: add isBook = true to the SharedPreferencesSingleton
      if (!isClosed) {
        emit(BookAppointmentSuccess(finalData: finalData));
      }
    } catch (e) {
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
      await SharedPreferencesSingleton.remove('appointmentId');
      List<String> finalData = [];
      // TODO: add isBook = false to the SharedPreferencesSingleton
      if (!isClosed) {
        emit(BookAppointmentSuccess(finalData: finalData));
      }
    } catch (e) {
      emit(BookAppointmentFailure(message: e.toString()));
    }
  }
}

Map<String, String> _setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
