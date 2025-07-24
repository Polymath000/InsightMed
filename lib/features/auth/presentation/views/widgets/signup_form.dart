import 'package:flutter/material.dart';

import '../../../../../core/helpers/patient_info_screen_arguments.dart';
import '../../../../../core/models/patient_model.dart' show PatientModel;
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../patient_info_screen.dart';
import 'constans.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  PatientModel patient = PatientModel(
    age: '',
    gender: '',
    phoneNumber: '',
    password: null,
    name: '',
    email: '',
  );
  String? confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) => Form(
    key: _formKey,
    autovalidateMode: autovalidateMode,
    child: Column(
      children: [
        CTextField(
          hint: 'Email',
          choose: false,
          type: TextInputType.emailAddress,
          onChanged: (final p0) {
            setState(() {
              patient.email = p0!;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 89),
        CTextField(
          hint: 'Password',
          choose: true,
          onChanged: (final p0) {
            setState(() {
              patient.password = p0;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 89),
        CTextField(
          hint: 'Confirm Password',
          choose: true,
          onChanged: (final p0) {
            setState(() {
              confirmPassword = p0;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        CButton(
          onTap: () async {
            if (_formKey.currentState!.validate() &&
                patient.password == confirmPassword) {
              _formKey.currentState!.save();

              await Navigator.pushReplacementNamed(
                context,
                PatientInformation.routeName,
                arguments: PatientInfoScreenArguments(patient: patient),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('SignUp pressed')));
              }
            } else if (patient.password != confirmPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Passwords do not match')),
              );
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },

          colorbackground: kMainColor,
          btnText: 'Create Account',
          colorText: kBasicColor,
        ),
      ],
    ),
  );
}
