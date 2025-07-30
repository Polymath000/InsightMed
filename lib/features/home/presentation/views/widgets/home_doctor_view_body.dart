import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/enums/patient_enum.dart';
import '../../controllers/get_patients_cubit/get_patients_cubit.dart';
import 'home_app_bar.dart';
import 'patient_card.dart';

class HomeDoctorViewBody extends StatefulWidget {
  const HomeDoctorViewBody({required this.patients, super.key});
  final List<UserEntity> patients;

  @override
  State<HomeDoctorViewBody> createState() => _HomeDoctorViewBodyState();
}

class _HomeDoctorViewBodyState extends State<HomeDoctorViewBody> {
  PatientStatusEnum? _selectedStatus;
  late List<UserEntity> _patients;

  @override
  void initState() {
    _patients = widget.patients;
    super.initState();
  }

  @override
  void dispose() {
    _selectedStatus = null;
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    void filterPatients() {
      if (_selectedStatus != null) {
        _patients = widget.patients
            .where((final patient) => patient.status == _selectedStatus)
            .toList();
      } else {
        _patients = widget.patients;
      }
      setState(() {});
    }

    return RefreshIndicator(
      onRefresh: context.read<GetPatientsCubit>().getPatients,
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SearchAnchor.bar(
                barHintText: 'Search for a patient',
                suggestionsBuilder: (final context, final controller) {
                  final filteredPatients = widget.patients.where(
                    (final patient) =>
                        patient.name?.toLowerCase().contains(
                          controller.text.toLowerCase(),
                        ) ??
                        false,
                  );
                  return filteredPatients
                      .map((final patient) => PatientCard(patient: patient))
                      .toList();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('All'),
                    selected: _selectedStatus == null,
                    onSelected: (_) {
                      _selectedStatus = null;
                      filterPatients();
                    },
                  ),
                  ...PatientStatusEnum.values.map(
                    (final e) => ChoiceChip(
                      label: Text(e.toString()),
                      selected: _selectedStatus == e,
                      onSelected: (_) {
                        _selectedStatus = e;
                        filterPatients();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: _patients.length,
            itemBuilder: (_, final index) =>
                PatientCard(patient: _patients[index]),
          ),
        ],
      ),
    );
  }
}
