import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/entities/ray_entity.dart';
import '../../../../core/helpers/dio_error_message.dart';
import '../../../../core/helpers/get_user.dart';
import '../../../../core/models/ray_model.dart';
import '../../../../core/services/dio/auth_dio.dart';
part 'upload_ray_state.dart';

class UploadRayCubit extends Cubit<UploadRayState> {
  UploadRayCubit() : super(UploadRayInitial());

  Future<void> uploadRay({required final RayEntity rayEntity}) async {
    emit(UploadRayLoading());
    try {
      RayModel rayModel;
      rayModel = RayModel.fromEntity(rayEntity);
      final data = rayModel.toJson();
      final formData = FormData();
      if (data['image'] != null && data['image'].isNotEmpty) {
        formData.files.add(
          MapEntry('image', await MultipartFile.fromFile(data['image'])),
        );
      }
      formData.fields.addAll([
        MapEntry('temperature', data['temperature'].toString()),
        MapEntry('systolic_bp', data['systolic_bp'].toString()),
        MapEntry('diastolic_bp', data['diastolic_bp'].toString()),
        MapEntry('heart_rate', data['heart_rate'].toString()),
        MapEntry('has_cough', data['has_cough'].toString()),
        MapEntry('can_smell_taste', data['can_smell_taste'].toString()),
        MapEntry('has_headaches', data['has_headaches'].toString()),
      ]);
      final dioInstance = dio();
      var response = await dioInstance.post(
        '/rays',
        data: formData,
        options: Options(headers: _setHeaders()),
      );
      emit(UploadRaySuccess());
    } on dio_package.DioException catch (e) {
      final userMessage = mapDioErrorToMessage(e);
      emit(UploadRayFailure(message: userMessage));
    } on Exception catch (e) {
      emit(UploadRayFailure(message: e.toString()));
    }
  }

  Map<String, String> _setHeaders() => {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${getUser!.token}',
  };
}
