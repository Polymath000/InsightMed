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
  String name = '';
  String age = '';
  String age = '';
  String phoneNumber = '';
  String gender = 'male';

  @override
  Widget build(final BuildContext context) {
    // TODO(Anyone): Replace this to use textEditingController
    var user = widget.user;
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        // spacing: 10,
        children: [
          AppTextField(
            labelText: 'Full Name *',
            hintText: 'Enter your full name',
            onChanged: (final p0) {
              name = p0;
            },
            validator: (final value) {
              if (value!.isEmpty) {
              if (value!.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
          ),
          AppTextField(
            labelText: 'Age *',
            hintText: 'Enter your age',
            keyboardType: TextInputType.number,
            onChanged: (final p0) {
              age = p0;
            },
            validator: (final value) {
              if (value!.isEmpty) {
              if (value!.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
          ),
          AppTextField(
            labelText: 'Phone Number *',
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            onChanged: (final p0) {
              phoneNumber = p0;
            },
            validator: (final value) {
              if (value!.isEmpty) {
            validator: (final value) {
              if (value!.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
          ),
          const PatientTextOfTextField(text: 'Gender *'),
          RadioBtn(
            onChanged: (final p0) {
              gender = p0 ?? 'male';
              gender = p0 ?? 'male';
            },
          ),
          const Divider(),
          FilledButton(
            onPressed: () async {
              user = user.copyWith(
                age: age,
                gender: gender,
                name: name,
                phoneNumber: phoneNumber,
                role: 'patient',
                role: 'patient',
              );
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
