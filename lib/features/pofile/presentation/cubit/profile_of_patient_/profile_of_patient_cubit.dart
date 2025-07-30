import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/dio_error_message.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/repos/user_repo.dart';
import '../../../../../core/services/dio/auth_dio.dart';
import '../../../../../core/services/get_it_service.dart';

part 'profile_of_patient_state.dart';

class ProfileOfPatientCubit extends Cubit<ProfileOfPatientState> {
  ProfileOfPatientCubit() : super(ProfileOfPatientInitial());

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
      var userModel = UserModel.fromEntity(user);
      final jsonData = userModel.toJson();
      await dioInstance.put(
        '/me',
        data: jsonData,
        options: Options(headers: _setHeaders()),
      );
      await getIt<UserRepo>().updateLocal(user);
      if (!isClosed) {
        emit(ProfileOfPatientSuccess(user: user));
      }
    } on dio_package.DioException catch (e) {
      final userMessage = mapDioErrorToMessage(e);
      emit(ProfileOfPatientFailure(message: userMessage));
    } on Exception {
      emit(
        ProfileOfPatientFailure(
          message: 'There was an error , please try again later',
        ),
      );
    }
  }
}
