import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_show_snack_bar.dart';
import '../../../../core/helpers/on_generate_routes.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({required this.email, required this.password, super.key});
  static const routeName = 'LoadingView';
  final String email;
  final String password;

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Future<void> _performLogin(final BuildContext context) async {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    await authCubit.logout();
    await authCubit.login(email: widget.email, password: widget.password);
  }

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => AuthCubit(),
    child: Builder(
      builder: (final context) {
        _performLogin(context);
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (final context, final state) async {
            if (state is AuthSuccess) {
              await AppRoutes.main(context);
            } else if (state is AuthFailure) {
              customShowSnackBar(context: context, message: state.message);
            }
          },
          builder: (final context, final state) =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    ),
  );
}

class LoadingViewArgs {
  const LoadingViewArgs({required this.email, required this.password});

  final String email;
  final String password;
}
