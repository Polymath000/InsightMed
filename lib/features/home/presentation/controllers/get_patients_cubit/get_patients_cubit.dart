import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/enums/patient_enum.dart';
import '../../../../../core/repos/user_repo.dart';
import '../../../../../core/services/get_it_service.dart';

part 'get_patients_state.dart';

class GetPatientsCubit extends Cubit<GetPatientsState> {
  GetPatientsCubit() : super(const GetPatientsInitial()) {
    unawaited(getPatients());
  }

  PatientStatusEnum? selectedStatus;

  final List<UserEntity> allPatients = List<UserEntity>.empty(growable: true);
  final List<UserEntity> filteredPatients = List<UserEntity>.empty(
    growable: true,
  );

  Future<void> getPatients() async {
    emit(const GetPatientsLoading());
    try {
      final users = await getIt<UserRepo>().getPatientsFromApi();
      final allPatients = users
        ..sort(
          (final a, final b) =>
              b.updatedAt?.compareTo(a.updatedAt ?? DateTime.now()) ?? 0,
        );
      this.allPatients.addAll(allPatients);
      emit(GetPatientsSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(GetPatientsFailure(e.toString()));
    }
  }

  void filterByStatus(final PatientStatusEnum? e) {
    selectedStatus = e;
    if (selectedStatus == null) {
      filteredPatients.clear();
      return emit(GetPatientsSuccess());
    }
    filteredPatients
      ..clear()
      ..addAll(allPatients.where((final patient) => patient.statuses == e));
    return emit(GetPatientsSuccess());
  }
}

// final List<UserEntity> _patients = <UserEntity>[
//   UserEntity(
//     id: 1,
//     name: 'Ahmed Youssef',
//     email: 'ahmed.youssef@example.com',
//     password: 'password123',
//     passwordConfirmation: 'password123',
//     gender: 'male',
//     age: '24',
//     phoneNumber: '01001234567',
//     role: 'patient',
//     specialty: 'General',
//     lastVisit: DateTime(2025, 7, 1),
//     status: PatientStatusEnum.critical,
//   ),
//   UserEntity(
//     id: 2,
//     name: 'Sara Hamed',
//     email: 'sara.hamed@example.com',
//     password: 'saraPass456',
//     passwordConfirmation: 'saraPass456',
//     gender: 'female',
//     age: '30',
//     phoneNumber: '01009876543',
//     role: 'patient',
//     specialty: 'Dermatology',
//     lastVisit: DateTime(2025, 6, 20),
//     status: PatientStatusEnum.regular,
//   ),
//   UserEntity(
//     id: 3,
//     name: 'Mohamed Ali',
//     email: 'mohamed.ali@example.com',
//     password: 'moAliPass',
//     passwordConfirmation: 'moAliPass',
//     gender: 'male',
//     age: '28',
//     phoneNumber: '01122334455',
//     role: 'patient',
//     specialty: 'Cardiology',
//     lastVisit: DateTime(2025, 6, 15),
//     status: PatientStatusEnum.regular,
//   ),
//   UserEntity(
//     id: 4,
//     name: 'Nour Hassan',
//     email: 'nour.hassan@example.com',
//     password: 'nourSecure',
//     passwordConfirmation: 'nourSecure',
//     gender: 'female',
//     age: '22',
//     phoneNumber: '01234567890',
//     role: 'patient',
//     specialty: 'Neurology',
//     lastVisit: DateTime(2025, 5, 30),
//     status: PatientStatusEnum.followUp,
//   ),
//   UserEntity(
//     id: 5,
//     name: 'Omar Adel',
//     email: 'omar.adel@example.com',
//     password: 'omar2025',
//     passwordConfirmation: 'omar2025',
//     gender: 'male',
//     age: '26',
//     phoneNumber: '01007778899',
//     role: 'patient',
//     specialty: 'Orthopedics',
//     lastVisit: DateTime(2025, 5, 18),
//     status: PatientStatusEnum.newPatient,
//   ),
//   UserEntity(
//     id: 6,
//     name: 'Mona Gamal',
//     email: 'mona.gamal@example.com',
//     password: 'monaPass!',
//     passwordConfirmation: 'monaPass!',
//     gender: 'female',
//     age: '35',
//     phoneNumber: '01119998877',
//     role: 'patient',
//     specialty: 'Gynecology',
//     lastVisit: DateTime(2025, 7, 10),
//     status: PatientStatusEnum.newPatient,
//   ),
//   UserEntity(
//     id: 7,
//     name: 'Yasser Ibrahim',
//     email: 'yasser.ibrahim@example.com',
//     password: 'yasser2025',
//     passwordConfirmation: 'yasser2025',
//     gender: 'male',
//     age: '40',
//     phoneNumber: '01224446688',
//     role: 'patient',
//     specialty: 'Urology',
//     lastVisit: DateTime(2025, 6, 5),
//     status: PatientStatusEnum.critical,
//   ),
//   UserEntity(
//     id: 8,
//     name: 'Hana Adel',
//     email: 'hana.adel@example.com',
//     password: 'hanaSecure',
//     passwordConfirmation: 'hanaSecure',
//     gender: 'female',
//     age: '29',
//     phoneNumber: '01003336655',
//     role: 'patient',
//     specialty: 'ENT',
//     lastVisit: DateTime(2025, 5, 25),
//     status: PatientStatusEnum.followUp,
//   ),
//   UserEntity(
//     id: 9,
//     name: 'Khaled Saeed',
//     email: 'khaled.saeed@example.com',
//     password: 'khaledPass',
//     passwordConfirmation: 'khaledPass',
//     gender: 'male',
//     age: '33',
//     phoneNumber: '01115552233',
//     role: 'patient',
//     specialty: 'Psychiatry',
//     lastVisit: DateTime(2025, 4, 12),
//     status: PatientStatusEnum.followUp,
//   ),
//   UserEntity(
//     id: 10,
//     name: 'Layla Samir',
//     email: 'layla.samir@example.com',
//     password: 'layla123',
//     passwordConfirmation: 'layla123',
//     gender: 'female',
//     age: '27',
//     phoneNumber: '01229998877',
//     role: 'patient',
//     specialty: 'Ophthalmology',
//     lastVisit: DateTime(2025, 3, 30),
//     status: PatientStatusEnum.critical,
//   ),
// ];
