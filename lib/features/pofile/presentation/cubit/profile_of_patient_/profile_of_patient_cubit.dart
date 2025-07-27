import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/dio_error_message.dart';
import '../../../../../core/helpers/get_auth_message.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/repos/user_repo.dart';
import '../../../../../core/services/dio/auth_dio.dart';
import '../../../../../core/services/get_it_service.dart';

part 'profile_of_patient_state.dart';

class ProfileOfPatientCubit extends Cubit<ProfileOfPatientState> {
  ProfileOfPatientCubit() : super(ProfileOfPatientInitial());
  final Map<String, String> messages = getAuthMessages;

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
        'Authorization': 'Bearer ${getUser!.token}',
      };

  Future<void> updatePatientDetails({required final UserEntity user}) async {
    emit(ProfileOfPatientLoading());
    try {
      log('token ${getUser!.token}');
      final dioInstance = dio();
      UserModel userModel = UserModel.fromEntity(user);
      final jsonData = userModel.toJson();
      final response = await dioInstance.put(
        '/me',
        data: jsonData,
        options: Options(headers: _setHeaders()),
      );
      await getIt<UserRepo>().updateLocal(user);
      emit(ProfileOfPatientSuccess(user: user));
    } on dio_package.DioException catch (e) {
      final userMessage = mapDioErrorToMessage(e);
      emit(ProfileOfPatientFailure(message: userMessage));
    } on Exception catch (e) {
      emit(ProfileOfPatientFailure(message: messages['msgUnknown']!));
    }
  }
}