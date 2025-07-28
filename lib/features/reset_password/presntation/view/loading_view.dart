import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart' as AppRoutes;
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key, required this.email, required this.password});
  static const routeName = 'LoadingView';
  final String email;
  final String password;

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Future<void> initState() async {
    super.initState();
    await _performLogin();
  }

  Future<void> _performLogin() async {
    final authCubit = context.read<AuthCubit>();
    await authCubit.logout();
    await authCubit.login(email: widget.email, password: widget.password);
  }

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (context) => AuthCubit(),
    child: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          await AppRoutes.main();
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
    ),
  );
}

class LoadingViewArgs {
  final String email;
  final String password;

  const LoadingViewArgs({required this.email, required this.password});
}
