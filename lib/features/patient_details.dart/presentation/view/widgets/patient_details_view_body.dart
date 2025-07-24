import 'package:flutter/material.dart';

import '../../../../../core/utls/themes/app_colors.dart';
import 'gesture_container.dart';
import 'patient_details_app_bar.dart';
import 'patient_tabs_view_body.dart';
import 'personal_patient_details.dart';
import 'tab_header_delegate.dart';

class PatientDetailsViewBody extends StatefulWidget {
  const PatientDetailsViewBody({super.key});

  @override
  State<PatientDetailsViewBody> createState() => _PatientDetailsViewBodyState();
}

class _PatientDetailsViewBodyState extends State<PatientDetailsViewBody> {
  int index = 0;

  @override
  Widget build(final BuildContext context) => CustomScrollView(
    slivers: [
      const PatientDetailsAppBar(),
      const SliverToBoxAdapter(
        child: ColoredBox(
          color: AppColors.white,
          child: PersonalPatientDetails(),
        ),
      ),
      // SliverMainAxisGroup(
      //   slivers: [

      //   ],
      // ),
      SliverPersistentHeader(pinned: true, delegate: middleAppBar()),
      SliverToBoxAdapter(child: PatientTabsViewBody(index: index)),
    ],
  );
  TabHeaderDelegate middleAppBar() => TabHeaderDelegate(
    child: ColoredBox(
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureContainer(
                  index: index,
                  bIndex: 0,
                  title: 'Notes',
                  onSelected: (final value) {
                    setState(() {
                      index = value;
                    });
                  },
                ),
                GestureContainer(
                  index: index,
                  bIndex: 1,
                  title: 'Rays',
                  onSelected: (final value) {
                    setState(() {
                      index = value;
                    });
                  },
                ),
                GestureContainer(
                  index: index,
                  bIndex: 2,
                  title: 'Appts',
                  onSelected: (final value) {
                    setState(() {
                      index = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    ),
  );
}
