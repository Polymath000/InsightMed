import 'package:flutter/material.dart';
import '../../../../../core/utls/app_images.dart';
import 'gesture_container.dart';
import 'patient_tabs_view_body.dart';

class PatientTabsView extends StatefulWidget {
  const PatientTabsView({super.key});

  @override
  State<PatientTabsView> createState() => _PatientTabsViewState();
}

class _PatientTabsViewState extends State<PatientTabsView> {
  int index = 0;
  @override
  Widget build(final BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureContainer(
              index: index,
              bIndex: 0,
              image: Assets.assetsImagesNoteIcon,
              title: 'Notes',
              onSelected: (int value) {
                setState(() {
                  index = value;
                });
              },
            ),
            GestureContainer(
              index: index,
              bIndex: 1,
              image: Assets.assetsImagesXRaysChestIcon,
              title: 'Rays',
              onSelected: (int value) {
                setState(() {
                  index = value;
                });
              },
            ),
            GestureContainer(
              index: index,
              bIndex: 2,
              image: Assets.assetsImagesAppts,
              title: 'Appts',
              onSelected: (int value) {
                setState(() {
                  index = value;
                });
              },
            ),
          ],
        ),
      ),
      Divider(),

      PatientTabsViewBody(index: index),
    ],
  );
}
