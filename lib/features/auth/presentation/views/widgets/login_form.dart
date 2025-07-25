import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'login_form_body.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.onLoadingChanged, super.key});
  final void Function(bool)? onLoadingChanged;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
          // TODO : Handle Navigator
          // if (BlocProvider.of<AuthCubit>(context).isDoctor()) {
          //   AppRoutes.main(context);
          // } else {
          //   // TODO : Go to doctor dashboard
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const Scaffold(
          //         body: Center(child: Text('Doctor Dashboard')),
          //       ),
          //     ),
          //   );
          // }
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
      child: const LoginFormBody(),
    ),
  );
}
