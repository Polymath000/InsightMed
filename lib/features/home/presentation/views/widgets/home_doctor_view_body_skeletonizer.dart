import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/enums/patient_enum.dart';
import 'home_doctor_view_body.dart';

class HomeDoctorViewBodySkeletonizer extends StatelessWidget {
  const HomeDoctorViewBodySkeletonizer({super.key});

  @override
  Widget build(_) => Skeletonizer(
    child: HomeDoctorViewBody(
      patients: List.generate(
        10,
        (final index) => UserEntity(
          name: 'Patient $index',
          status:
              PatientStatusEnum.values[index % PatientStatusEnum.values.length],
          age: '25',
          gender: 'Male',
        ),
      ),
    ),
  );
}
