import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../signup_screen.dart';
import 'constans.dart';

class DonnotHaveAnAccount extends StatelessWidget {
  const DonnotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: kAccount,
          ),
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: kMainColor,
            ),
          ),
        ),
      ],
    );
}
