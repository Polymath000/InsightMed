import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/services/dio/auth_dio.dart';

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
      var userEntity = user.toEntity();
      emit(ProfileOfPatientSuccess(user: user));
      return userEntity;
    } on Exception catch (e) {
      emit(ProfileOfPatientFailure(message: e.toString()));
      return const UserEntity();
    }
  }

  Map<String, String> _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $mainToken',
  };
}
