import 'package:flutter/material.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/helpers/patient_info_screen_arguments.dart';
import '../../../../../core/models/patient_model.dart' show PatientModel;
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'constans.dart';

class SignupForm extends StatefulWidget {
  final void Function(bool)? onLoadingChanged;
  const SignupForm({super.key, this.onLoadingChanged});
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
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
          validator: (value) {
            if (value!.length < 6) {
              return 'Password Length less than 6 letters';
            } else {
              return null;
            }
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
            setState(() {
              isLoading = true;
              widget.onLoadingChanged!(isLoading);
            });
            if (_formKey.currentState!.validate() &&
                patient.password == confirmPassword) {
              _formKey.currentState!.save();
              setState(() {
                isLoading = false;
                widget.onLoadingChanged!(isLoading);
              });
              await AppRoutes.patientInformation(
                context,
                patientInfo: PatientInfoScreenArguments(patient: patient),
              );
            } else if (patient.password != confirmPassword) {
              setState(() {
                isLoading = false;
                widget.onLoadingChanged!(isLoading);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Passwords do not match')),
              );
            } else {
              setState(() {
                isLoading = false;
                widget.onLoadingChanged!(isLoading);
              });
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
