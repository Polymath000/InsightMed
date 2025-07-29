part of 'get_rays_cubit.dart';

@immutable
sealed class GetRaysState {}

final class GetRaysInitial extends GetRaysState {}

final class GetRaysLoadding extends GetRaysState {}

final class GetRaysFailure extends GetRaysState {
  GetRaysFailure({required this.message});
  String message;
}

final class GetRaysSuccess extends GetRaysState {
  final List<RayEntity> rays;

  GetRaysSuccess({required this.rays});
}
