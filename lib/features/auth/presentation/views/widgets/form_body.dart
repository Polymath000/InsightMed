import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Widget build(final BuildContext context) => Form(
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
            widget.patient.name = p0!;
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
            widget.patient.age = p0!;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 100),
        const PatientTextOfTextField(text: 'Gender *'),
        RadioBtn(
          onChanged: (final p0) {
            widget.patient.gender = p0!;
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
            widget.patient.phoneNumber = p0!;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        Container(width: double.infinity, height: 1.h, color: kOffWhite),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        CButton(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              await BlocProvider.of<AuthCubit>(
                context,
              ).register(patient: widget.patient);
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
