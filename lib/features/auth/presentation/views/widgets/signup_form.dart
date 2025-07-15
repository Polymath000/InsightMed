import 'package:flutter/material.dart';
import '../patient_info_screen.dart';
import 'constans.dart';
import 'custbutton.dart';
import 'text_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String? email ;
  String ?password ;
  String? confirmPassword ;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) => Form(
    key: _formKey,
    autovalidateMode: autovalidateMode,
    child: Column(
      children: [
         CTextField(
          hinto: 'Email',
          choose: false,
          type: TextInputType.emailAddress,
          onChanged: (final p0) {
            email = p0;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 89),
        CTextField(
          hinto: 'Password', 
        choose: true,
        onChanged: (final p0) {
          password = p0;
        },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 89),
         CTextField(hinto: 'Confirm Password', 
         choose: true,
          onChanged: (final p0) {
            confirmPassword = p0;
          }
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        CButton(
          onTap: () {
            if (_formKey.currentState!.validate() && password == confirmPassword){
              _formKey.currentState!.save();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login pressed')));
              Navigator.pushNamed(context, PatientInformation.routeName);
            }else if (password != confirmPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Passwords do not match')),
              );
            } 
            
            else {
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
