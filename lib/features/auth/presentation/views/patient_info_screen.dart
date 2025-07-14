import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../main/presentation/views/main_view.dart';
import 'widgets/constans.dart';
import 'widgets/custbutton.dart';
import 'widgets/large_text_field.dart';
import 'widgets/radio_btn.dart';
import 'widgets/text_field.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({super.key});
  static const String routeName = 'patientInfo';
  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient Information",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: kSmain,
          ),
        ),
        // actions: [Icon(Icons.help)],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Step 1/1',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kStep,
                  ),
                ),
                Text(
                  'Initial Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kOR,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 300),
            Container(
              width: double.infinity,
              height: 7.h,
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
              "Please provide your basic information to get started. Field marked with * are required",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: kSmain,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),

            Row(
              children: [
                Text(
                  "Full Name *",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kSmain,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 110),
            CTextField(choose: false, hinto: 'Enter your full name'),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Row(
              children: [
                Text(
                  "Age *",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kSmain,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 110),
            CTextField(choose: false, hinto: 'Enter your age'),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Row(
              children: [
                Text(
                  'Gender *',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kSmain,
                  ),
                ),
              ],
            ),
            RadioBtn(),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Row(
              children: [
                Text(
                  'Phone Number *',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kSmain,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 110),
            CTextField(
              choose: false,
              hinto: 'Enter your age',
              type: TextInputType.phone,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Row(
              children: [
                Text(
                  'Medical Conditions(Optional)',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kSmain,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 110),
            CLargeTextField(
              choose: false,
              hinto: 'List any existing medical conditions or allergies',
              type: TextInputType.text,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),

            Container(width: double.infinity, height: 1.h, color: kOffWhite),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            CButton(
              onTap: () {
                Navigator.pushNamed(context, MainView.routeName); // Replace with actual route
              },
              btnText: "Continue ->",
              colorbackground: kMainColor,
              colorText: kBasicColor,
            ),
          ],
        ),
      ),
    );
}
