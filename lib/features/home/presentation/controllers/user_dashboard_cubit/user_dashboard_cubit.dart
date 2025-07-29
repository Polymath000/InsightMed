import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/repos/appointment_repo.dart';
import '../../../../../core/repos/ray_repo.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../notes/domain/repos/note_repo.dart';
import '../../../domain/entities/dashboard_entity.dart';

part 'user_dashboard_state.dart';

class UserDashboardCubit extends Cubit<UserDashboardState> {
  UserDashboardCubit() : super(const UserDashboardInitial()) {
    unawaited(_dashboard());
  }

  Future<void> _dashboard() async {
    emit(const UserDashboardLoading());
    final rays = await getIt<RayRepo>().getRays();
    final notes = await getIt<NoteRepo>().get(0);
    final appointment = await getIt<AppointmentRepo>().get();
    final dashboard = DashboardEntity(
      rays: rays,
      notes: notes,
      appointment: appointment,
    );
    emit(UserDashboardSuccess(dashboard));
  }
}
