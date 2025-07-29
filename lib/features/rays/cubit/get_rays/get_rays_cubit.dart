import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

import '../../../../core/constants/end_ponits.dart';
import '../../../../core/entities/ray_entity.dart';
import '../../../../core/helpers/get_user.dart';
import '../../../../core/models/ray_model.dart';
import '../../../../core/services/dio/auth_dio.dart';

part 'get_rays_state.dart';

class GetRaysCubit extends Cubit<GetRaysState> {
  GetRaysCubit() : super(GetRaysInitial());

  Future<List<RayEntity>> getRays() async {
    emit(GetRaysLoadding());
    try {
      var token = getUser!.token;
      final dioInstance = dio();
      final response = await dioInstance.get(
        EndPoint.getRays,
        options: Options(headers: _setHeaders()),
      );
      var jsonData = response.data['data'];

      var rayModel = <RayModel>[];
      var rayEntity = <RayEntity>[];
      for (final element in jsonData) {
        rayModel.add(RayModel.fromJson(element));
        rayEntity.add(const RayModel().toEntity());
      }
      if (!isClosed) {
        emit(GetRaysSuccess(rays: rayEntity));
      }
      return rayEntity;
    } catch (e) {
      emit(GetRaysFailure(message: e.toString()));
      return [];
    }
  }
}

Map<String, String> _setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer ${getUser!.token}',
};
