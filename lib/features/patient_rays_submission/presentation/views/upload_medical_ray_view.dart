import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utls/themes/app_colors.dart';
import '../../../../core/utls/themes/app_text_style.dart';
import '../../cubit/upload_ray/upload_ray_cubit.dart';
import 'widgets/upload_medical_ray_view_body.dart';

class UploadMedicalRayView extends StatefulWidget {
  const UploadMedicalRayView({super.key});
  static const String routeName = 'upload_medical_ray';

  @override
  State<UploadMedicalRayView> createState() => _UploadMedicalRayViewState();
}

class _UploadMedicalRayViewState extends State<UploadMedicalRayView> {
  bool isLoading = false;
  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,

    child: Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFE5E7EB)),
        ),
        backgroundColor: AppColors.white,
        shadowColor: AppColors.black,
        surfaceTintColor: AppColors.grey,
        title: Text(
          'Upload Medical Ray',
          style: AppTextStyles.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocProvider(
        create: (final context) => UploadRayCubit(),
        child: BlocConsumer<UploadRayCubit, UploadRayState>(
          listener: (final context, final state) {
            if (state is UploadRayLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is UploadRaySuccess) {
              setState(() {
                isLoading = true;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('The Data is Upload')),
              );
            } else if (state is UploadRayFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message ??
                        'There Was an error please try again later',
                  ),
                ),
              );
            }
          },
          builder: (final context, final state) => UploadMedicalRayViewBody(
            onChanged: (final p0) {
              setState(() {
                isLoading = p0;
              });
            },
          ),
        ),
      ),
    ),
  );
}
