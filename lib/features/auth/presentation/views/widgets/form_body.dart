import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/widgets/app_text_field.dart' show AppTextField;
import '../../cubit/auth/auth_cubit.dart';
import 'patient_text_of_textfield.dart';
import 'radio_btn.dart';

class FormBody extends StatefulWidget {
  const FormBody({required this.user, super.key});

  final UserEntity user;

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) {
    var user = widget.user;
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          AppTextField(
            labelText: 'Full Name *',
            hintText: 'Enter your full name',
            onChanged: (final p0) {
              user = user.copyWith(name: p0);
            },
          ),
          AppTextField(
            labelText: 'Age *',
            hintText: 'Enter your age',
            keyboardType: TextInputType.number,
            onChanged: (final p0) {
              user = user.copyWith(age: p0);
            },
          ),
          AppTextField(
            labelText: 'Phone Number *',
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            onChanged: (final p0) {
              user = user.copyWith(password: p0);
            },
          ),
          const PatientTextOfTextField(text: 'Gender *'),
          RadioBtn(
            onChanged: (final p0) {
              user = user.copyWith(gender: p0);
            },
          ),
          const Divider(),
          FilledButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await context.read<AuthCubit>().register(user: user);
              }
            },
            child: const IText('Continue ->'),
          ),
        ],
      ),
    );
  }
}
