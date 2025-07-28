import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'widget/verify_code_view_body.dart';

class VerifyCodeView extends StatefulWidget {
  VerifyCodeView({super.key, required this.email});
  final String email;
  static const routeName = 'VerifyCodeView';

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  bool isLoading = false;
  String code = '';
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
            } else if (state is VerifyCodeSuccess) {
              setState(() {
                isLoading = false;
              });
              await AppRoutes.createNewPasswordView(
                context,
                email: widget.email,
                code: code,
              );
            } else if (state is VerifyCodeLoading) {
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
          child: VerifyCodeViewBody(
            email: widget.email,
            onCodeChanged: (final value) {
              setState(() {
                code = value;
              });
            },
          ),
        ),
      ),
    ),
  );
}
