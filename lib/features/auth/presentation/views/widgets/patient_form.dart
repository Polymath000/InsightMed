import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'form_body.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({
    required this.user,
    super.key,
    required this.onLoadingChanged,
  });
  final UserEntity user;
  final void Function(bool)? onLoadingChanged;
  @override
  State<PatientForm> createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => AuthCubit(),
    child: BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          widget.onLoadingChanged?.call(true);
        } else if (state is AuthSuccess) {
          widget.onLoadingChanged?.call(false);
          AppRoutes.main(context);
        } else if (state is AuthFailure) {
          widget.onLoadingChanged?.call(false);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message.toString())));
        } else {
          widget.onLoadingChanged?.call(false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('There was an error , please try again later'),
            ),
          );
        }
      },
      child: FormBody(widget: widget),
    ),
  );
}
