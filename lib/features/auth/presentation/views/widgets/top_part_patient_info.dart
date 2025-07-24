import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constans.dart';

class TopPartPatientInfo extends StatelessWidget {
  const TopPartPatientInfo({super.key});

  @override
  Widget build(final BuildContext context) => Column(
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
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height / 100),
      Text(
        'Please provide your basic information to get started. '
        'Field marked with * are required',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: kSmain,
        ),
      ),
    ],
  );
}
