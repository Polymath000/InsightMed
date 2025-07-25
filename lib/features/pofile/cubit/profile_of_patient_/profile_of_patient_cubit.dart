import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/services/dio/auth_dio.dart';

part 'profile_of_patient_state.dart';

class ProfileOfPatientCubit extends Cubit<ProfileOfPatientState> {
  ProfileOfPatientCubit() : super(ProfileOfPatientInitial());

  Future<UserEntity> getPatientDetails() async {
    emit(ProfileOfPatientLoading());
    try {
      final dioInstance = dio();
      final response = await dioInstance.get(
        '/me',
        options: Options(headers: _setHeaders()),
      );
      Map<String, dynamic> jsonData = response.data;
      UserModel user;
      final userData = jsonData['data'];
      user = UserModel.fromJson(userData);
      UserEntity userEntity = user.toEntity();
      emit(ProfileOfPatientSuccess(user: user));
      return userEntity;
    } catch (e) {
      emit(ProfileOfPatientFailure(message: e.toString()));

      return UserEntity();
    }
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer 60|sLqtGTxdRFZaZT1PA457GE4FignO2FHNgWiCAsKD79e30675',
  };
}
