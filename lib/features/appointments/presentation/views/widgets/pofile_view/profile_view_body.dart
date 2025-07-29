import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custbutton.dart';
import '../../../../../pofile/presentation/views/widgets/contact_info_container.dart';
import '../../../../../pofile/presentation/views/widgets/heading_text_profil.dart';
import '../../../../../pofile/presentation/views/widgets/personal_info.dart';
import '../../../../../pofile/presentation/views/widgets/profile_main_countainer_decoration.dart';
import '../../../../../pofile/presentation/views/widgets/security_container.dart';
import '../../../../../pofile/presentation/views/widgets/shadow_container.dart';
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
      CustomButton(
        colorText: Colors.white,
        // colorbackground: kMainColor,
        btnText: 'Save Change',
        onTap: () {
          // Navigator.pushNamed(context, _);
        },
      ),
    ],
  );
}
