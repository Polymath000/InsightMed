import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helpers/custom_show_snack_bar.dart';
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
      appBar: AppBar(title: const Text('Upload Medical Ray')),
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
              customShowSnackBar(
                context: context,
                message: 'The Data is Upload',
              );
            } else if (state is UploadRayFailure) {
              customShowSnackBar(
                context: context,
                message: state.message ?? 'There was an error',
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
