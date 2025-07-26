part of 'upload_ray_cubit.dart';

@immutable
sealed class UploadRayState {}

final class UploadRayInitial extends UploadRayState {}
final class UploadRaySuccess extends UploadRayState {}
final class UploadRayFailure extends UploadRayState {
   UploadRayFailure({required this.message});
  final String? message;
}
final class UploadRayLoading extends UploadRayState {}
