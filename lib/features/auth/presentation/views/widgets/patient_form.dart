import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../main/presentation/views/main_view.dart';
import 'constans.dart';
import '../../../../../core/widgets/custbutton.dart';
import 'large_text_field.dart';
import 'patient_text_of_textfield.dart';
import 'radio_btn.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  State<PatientForm> createState() => _PatientFormState();
}

final _formKey = GlobalKey<FormState>();

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? fullName;
String? age;
String? phoneNumber;

class _PatientFormState extends State<PatientForm> {
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
            fullName = p0;
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
            age = p0;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 100),
        const PatientTextOfTextField(text: 'Gender *'),
        const RadioBtn(),
        SizedBox(height: MediaQuery.of(context).size.height / 100),
        const PatientTextOfTextField(text: 'Phone Number *'),
        SizedBox(height: MediaQuery.of(context).size.height / 110),
        CTextField(
          choose: false,
          hint: 'Enter your phone number',
          type: TextInputType.phone,
          onChanged: (final p0) {
            phoneNumber = p0;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 100),
        const PatientTextOfTextField(text: 'Medical Conditions(Optional)'),
        SizedBox(height: MediaQuery.of(context).size.height / 110),
        const CLargeTextField(
          choose: false,
          hinto: 'List any existing medical conditions or allergies',
          type: TextInputType.text,
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 100),
        Container(width: double.infinity, height: 1.h, color: kOffWhite),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        CButton(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login pressed')));
              await Navigator.pushNamed(context, MainView.routeName);
            } // Replace with actual route
          },
          btnText: 'Continue ->',
          colorbackground: kMainColor,
          colorText: kBasicColor,
        ),
      ],
    ),
  );
}
