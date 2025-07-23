import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../auth/presentation/views/widgets/constans.dart';
import '../../../../../auth/presentation/views/widgets/custbutton.dart';
import 'widgets/contact_info_container.dart';
import 'widgets/heading_text_profil.dart';
import 'widgets/main_container_decoration.dart';
import 'widgets/personal_info.dart';
import 'widgets/security_container.dart';
import 'widgets/shadow_container.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(final BuildContext context) => Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(boxShadow: [shadowContainer()]),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.all(10),
                width: 358.w,
                height: 49.h,
                decoration: MainCountainerDecoration(),
                child: const HeadingTextProfileEdit(head: 'Personal Information'),
              ),
              const PersonalContainer(),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        DecoratedBox(
          decoration: BoxDecoration(boxShadow: [shadowContainer()]),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.all(10),
                width: 358.w,
                height: 49.h,
                decoration: MainCountainerDecoration(),
                child: const HeadingTextProfileEdit(head: 'Contact Information'),
              ),
              const ContactInfoContainer(),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),

        DecoratedBox(
          decoration: BoxDecoration(boxShadow: [shadowContainer()]),
          child: Column(
            children: [
              Container(
                width: 358.w,
                height: 49.h,
                decoration: MainCountainerDecoration(),
                child: const HeadingTextProfileEdit(head: 'Security'),
              ),
              // Container(height: 1, color: Colors.grey),
            ],
          ),
        ),
        const SecurityContainer(),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        CButton(
          colorText: Colors.white,
          colorbackground: kMainColor,
          btnText: 'Save Change',
          onTap: () {
            // Navigator.pushNamed(context, _);
          },
        ),
      ],
    );
}
