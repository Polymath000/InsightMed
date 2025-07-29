import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

import '../../../../core/entities/ray_entity.dart';
import '../../../../core/repos/ray_repo.dart';
import '../../../../core/services/get_it_service.dart';

part 'get_rays_state.dart';

class GetRaysCubit extends Cubit<GetRaysState> {
  GetRaysCubit() : super(GetRaysInitial()) {
    unawaited(getRays());
  }

  Future<void> getRays() async {
    emit(GetRaysLoadding());
    try {
      final rays = await getIt<RayRepo>().getRays();
      emit(GetRaysSuccess(rays: rays));
    } on Exception catch (e) {
      emit(GetRaysFailure(message: e.toString()));
    }
  }
}
