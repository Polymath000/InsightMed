import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'widget/reset_password_view_body.dart';

class ResetPasswordView extends StatefulWidget {
  ResetPasswordView({super.key});
  static const routeName = 'ResetPasswordView';

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool isLoading = false;
  String email = '';
  @override
  Widget build(BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,

    child: Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [],
      ),
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(),
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) async {
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
            } else if (state is ResetPasswordSuccess && email.isNotEmpty) {
              setState(() {
                isLoading = false;
              });
              await AppRoutes.vrerifyCodeView(context, email: email);
            } else if (state is ResetPasswordLoading) {
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
          child: ResetPasswordViewBody(
            onEmailChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
        ),
      ),
    ),
  );
}
