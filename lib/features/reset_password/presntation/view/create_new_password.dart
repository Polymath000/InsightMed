import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'widget/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatefulWidget {
  CreateNewPasswordView({super.key, required this.email});
  final String email;
  static const routeName = 'CreateNewPasswordView';

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,

    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [],
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
            } else if (state is CreateNewPasswordSuccess) {
              setState(() {
                isLoading = false;
              });
              await AppRoutes.login(context);
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
          child: CreateNewPasswordViewBody(email: widget.email),
        ),
      ),
    ),
  );
}
