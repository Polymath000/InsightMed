import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/custom_show_snack_bar.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'patient_information_form_body.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({
    required this.user,
    required this.onLoadingChanged,
    super.key,
  });
  final UserEntity user;
  final void Function({bool isLoading})? onLoadingChanged;
  @override
  State<PatientForm> createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => AuthCubit(),
    child: BlocListener<AuthCubit, AuthState>(
      listener: (final context, final state) async {
        if (state is AuthLoading) {
          widget.onLoadingChanged?.call(isLoading: true);
        } else if (state is AuthSuccess) {
          widget.onLoadingChanged?.call(isLoading: false);
          await AppRoutes.main(context);
        } else if (state is AuthFailure) {
          widget.onLoadingChanged?.call(isLoading: false);
          customShowSnackBar(context: context, message: state.message);
        } else {
          widget.onLoadingChanged?.call(isLoading: false);
          customShowSnackBar(
            context: context,
            message: 'There was an error , please try again later',
          );
        }
      },
      child: FormBody(user: widget.user),
    ),
  );
}
