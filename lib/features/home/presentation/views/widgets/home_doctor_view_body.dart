import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/patient_enum.dart';
import '../../controllers/get_patients_cubit/get_patients_cubit.dart';
import 'home_app_bar.dart';
import 'patient_card.dart';

class HomeDoctorViewBody extends StatelessWidget {
  const HomeDoctorViewBody({super.key});

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<GetPatientsCubit, GetPatientsState>(
        builder: (final context, final state) {
          final cubit = context.read<GetPatientsCubit>();
          final patients = cubit.filteredPatients.isEmpty
              ? cubit.allPatients
              : cubit.filteredPatients;
          return CustomScrollView(
            slivers: [
              const HomeAppBar(),
              if (state is GetPatientsLoading)
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 300,),
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              else if (state is GetPatientsSuccess) ...{
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SearchAnchor.bar(
                      barHintText: 'Search for a patient',
                      suggestionsBuilder: (final context, final controller) {
                        final filteredPatients = cubit.allPatients.where(
                          (final patient) =>
                              patient.name?.toLowerCase().contains(
                                controller.text.toLowerCase(),
                              ) ??
                              false,
                        );
                        return filteredPatients
                            .map(
                              (final patient) => PatientCard(patient: patient),
                            )
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
                          selected: cubit.selectedStatus == null,
                          onSelected: (_) => cubit.filterByStatus(null),
                        ),
                        ...PatientStatusEnum.values.map(
                          (final e) => ChoiceChip(
                            label: Text(e.toString()),
                            selected: cubit.selectedStatus == e,
                            onSelected: (_) => cubit.filterByStatus(e),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.list(
                  children: patients
                      .map((final patient) => PatientCard(patient: patient))
                      .toList(),
                ),
              } else if (state is GetPatientsFailure)
                SliverToBoxAdapter(child: Center(child: Text(state.message))),
            ],
          );
        },
      );
}
