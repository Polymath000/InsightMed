import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/custom_show_snack_bar.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/repos/auth_repo.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../reset_password/cubit/reset_password_cubit/reset_password_cubit.dart';

class SecurityContainer extends StatefulWidget {
  const SecurityContainer({required this.onChangePassword, super.key});
  final ValueChanged<bool>? onChangePassword;

  @override
  State<SecurityContainer> createState() => _SecurityContainerState();
}

class _SecurityContainerState extends State<SecurityContainer> {
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => ResetPasswordCubit(),
    child: Builder(
      builder: (final context) =>
          BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listener: (final context, final state) async {
              if (state is ResetPasswordFailure) {
                setState(() {
                  widget.onChangePassword!(false);
                });
                customShowSnackBar(context: context, message: state.message);
              } else if (state is ResetPasswordSuccess &&
                  getUser!.email!.isNotEmpty) {
                setState(() {
                  widget.onChangePassword!(false);
                });
                await AppRoutes.vrerifyCodeView(
                  context,
                  email: getUser!.email!,
                );
              } else if (state is ResetPasswordLoading) {
                setState(() {
                  widget.onChangePassword!(true);
                });
              } else {
                customShowSnackBar(
                  context: context,
                  message: 'There was an error please try again later',
                );
              }
            },
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock_outlined),
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.arrow_right_outlined),
                  onTap: () async {
                    await context.read<ResetPasswordCubit>().sendVerifiedCode(
                      email: getUser!.email ?? '@',
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('LogOut'),
                  trailing: const Icon(Icons.arrow_right_outlined),
                  onTap: () => Future.wait([
                    getIt<AuthRepository>().logout(),
                    AppRoutes.login(context),
                  ]),
                ),
              ],
            ),
          ),
    ),
  );
}
