import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'constans.dart';
import 'patient_form.dart';
import 'patient_text_of_textfield.dart';
import 'radio_btn.dart';

class FormBody extends StatelessWidget {
  FormBody({super.key, required this.widget});

  final PatientForm widget;
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) {
    UserEntity user = widget.user;
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const PatientTextOfTextField(text: 'Full Name *'),
          SizedBox(height: MediaQuery.of(context).size.height / 110),
          CTextField(
            choose: false,
            hint: 'Enter your full name',
            onChanged: (final p0) {
              user = user.copyWith(name: p0);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 100),
          const PatientTextOfTextField(text: 'Age *'),
          SizedBox(height: MediaQuery.of(context).size.height / 110),
          CTextField(
            choose: false,
            hint: 'Enter your age',
            type: TextInputType.number,
            onChanged: (final p0) {
              user = user.copyWith(age: p0);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 100),
          const PatientTextOfTextField(text: 'Gender *'),
          RadioBtn(
            onChanged: (final p0) {
              user = user.copyWith(gender: p0);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 100),
          const PatientTextOfTextField(text: 'Phone Number *'),
          SizedBox(height: MediaQuery.of(context).size.height / 110),
          CTextField(
            choose: false,
            hint: 'Enter your phone number',
            type: TextInputType.phone,
            onChanged: (final p0) {
              user = user.copyWith(password: p0);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Container(width: double.infinity, height: 1.h, color: kOffWhite),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          CButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<AuthCubit>().register(user: user);
              }
            },
            btnText: 'Continue ->',
            colorbackground: kMainColor,
            colorText: kBasicColor,
          ),
        ],
      ),
    );
  }
}
