import 'package:flutter/material.dart';
import 'numeric_vitals.dart';
import 'symptoms.dart';
import 'upload_medical_ray_button.dart';
import 'upload_ray_image.dart';

class UploadMedicalRayViewBody extends StatelessWidget {
  const UploadMedicalRayViewBody({super.key});

  @override
  Widget build(final BuildContext context) => const Padding(
    padding: EdgeInsets.only(top:  20, left: 32, right: 32),
    child: Form(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom:73),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: UploadRayImage()),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(child: NumericVitals()),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(child: Symptoms()),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          ),             
            Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: UploadMedicalRayButton(),
            ),
        ],
      ),
    ),
  );
}
