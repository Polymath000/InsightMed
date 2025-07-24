import 'package:flutter/material.dart';

class PatientDetailsAppBar extends StatelessWidget {
  const PatientDetailsAppBar({super.key});

  @override
  Widget build(final BuildContext context) =>
      const SliverAppBar.large(title: Text('Patient Details'));

  // SliverAppBar(
  //     expandedHeight: 130,
  //     toolbarHeight: 50,
  //     flexibleSpace: FlexibleSpaceBar(
  //       title: Text(
  //         'Patient Details',
  //         style: AppTextStyles.titleLarge?.copyWith(
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ),
  //     backgroundColor: AppColors.white,
  //     shadowColor: AppColors.black,
  //     surfaceTintColor: AppColors.grey,

  //     shape: const RoundedRectangleBorder(
  //       side: BorderSide(color: Color(0xFFE5E7EB)),
  //     ),
  //   );
}
