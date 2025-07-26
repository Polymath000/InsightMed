import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:meta/meta.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/entities/ray_entity.dart';
import '../../../../core/helpers/dio_error_message.dart';
import '../../../../core/models/ray_model.dart';
import '../../../../core/services/dio/auth_dio.dart';

part 'upload_ray_state.dart';

class UploadRayCubit extends Cubit<UploadRayState> {
  UploadRayCubit() : super(UploadRayInitial());

  Future<void> uploadRay({required  final RayEntity rayEntity})async{
    emit(UploadRayLoading());
    try {
      RayModel rayModel;
      rayModel = RayModel.fromEntity(rayEntity);
      final data = rayModel.toJson();
      final dioInstance = dio();
      var response = await dioInstance.post(
        '/rays',
        data: data,
        options: Options(
          headers: _setHeaders()
        )
      );
      emit(UploadRaySuccess());
    } on dio_package.DioException catch (e) {
      final userMessage = mapDioErrorToMessage(e);
      emit(UploadRayFailure(message: userMessage));
    }catch (e) {
      emit(UploadRayFailure(message: e.toString()));
    }
  }
  
  Map<String, String> _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $mainToken',
  };
}
