import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utls/themes/app_colors.dart';
import '../../core/utls/themes/app_text_style.dart';
import '../../core/widgets/custbutton.dart';
import '../auth/presentation/views/widgets/constans.dart';
import 'widgets/contact_info_container.dart';
import 'widgets/heading_text_profil.dart';
import 'widgets/main_container_decoration.dart';
import 'widgets/personal_info.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/security_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(final BuildContext context) => CustomScrollView(
    slivers: [
      const ProfileAppBar(),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: 358.w,
                height: 49.h,
                decoration: MainCountainerDecoration(),
                child: const HeadingTextProfileEdit(
                  head: 'Personal Information',
                ),
              ),
              const PersonalContainer(),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: MediaQuery.of(context).size.height / 50),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: 358.w,
                height: 49.h,
                decoration: MainCountainerDecoration(),
                child: const HeadingTextProfileEdit(
                  head: 'Contact Information',
                ),
              ),
              const ContactInfoContainer(),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: MediaQuery.of(context).size.height / 50),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: 358.w,
                height: 49.h,
                decoration: MainCountainerDecoration(),
                child: const HeadingTextProfileEdit(head: 'Security'),
              ),
            ],
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SecurityContainer(),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: MediaQuery.of(context).size.height / 50),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CButton(
            colorText: Colors.white,
            colorbackground: kMainColor,
            btnText: 'Save Change',
            onTap: () {
              // Navigator.pushNamed(context, _);
            },
          ),
        ),
      ),
    ],
  );
}
