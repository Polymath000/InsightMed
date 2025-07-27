import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../../../core/services/dio/auth_dio.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentInitial());
  late String message;
  Future<List<String>> getAppiontments({required String date}) async {
    emit(BookAppointmentLoading());
    try {
      final dioInstance = dio();

      final response = await dioInstance.get(
        '/appointments/available',
        queryParameters: {"doctor_id": 5, "date": date},
        options: Options(headers: _setHeaders()),
      );
      final Map<String, dynamic> jsonData = response.data;
      final List<String> data = List<String>.from(jsonData['data']);
      List<String> finalData = List<String>.filled(data.length, '', growable: false);;
      for (int i = 0; i< data.length;i++) {
        finalData[i] = data[i].substring(11, 16);
      }
      emit(BookAppointmentSuccess(finalData: finalData));
      return finalData;
    } catch (e) {
      emit(BookAppointmentFailure(message: e.toString()));
      log(e.toString());
      return [];
    }
  }
}

Map<String, String> _setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
