import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpers/on_generate_routes.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'widget/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({
    required this.email, required this.code, super.key,
  });
  final String email;
  static const routeName = 'CreateNewPasswordView';
  final String code;
  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  bool isLoading = false;
  String password = '';
  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,

    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (final context) => ResetPasswordCubit()),
          BlocProvider(create: (final context) => AuthCubit()),
        ],
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (final context,final state) async {
            if (state is ResetPasswordFailure) {
              setState(() {
                isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is CreateNewPasswordSuccess) {
              setState(() {
                isLoading = false;
              });

              await AppRoutes.loadingView(
                context,
                email: widget.email,
                password: password,
              );
            } else if (state is CreateNewPasswordLoading) {
              setState(() {
                isLoading = true;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('There was an error please try again later'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: CreateNewPasswordViewBody(
            email: widget.email,
            onPasswordChanged: (final value) {
              password = value;
            },
            code: widget.code,
          ),
        ),
      ),
    ),
  );
}
