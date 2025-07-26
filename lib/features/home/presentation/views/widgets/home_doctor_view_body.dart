import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/borders.dart' show AppBorders;
import '../../../../../core/enums/patient_enum.dart';
import '../../controllers/get_patients_cubit/get_patients_cubit.dart';
import 'home_app_bar.dart';

class HomeDoctorViewBody extends StatelessWidget {
  const HomeDoctorViewBody({super.key});

  @override
  Widget build(
    final BuildContext context,
  ) => BlocBuilder<GetPatientsCubit, GetPatientsState>(
    builder: (final context, final state) => CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SearchAnchor.bar(
              barHintText: 'Search for a patient',
              suggestionsBuilder: (final context, final controller) =>
                  const <Widget>[
                    ListTile(title: Text('Search suggestion 1')),
                    ListTile(title: Text('Search suggestion 2')),
                    ListTile(title: Text('Search suggestion 3')),
                  ],
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
                  selected: true,
                  onSelected: (final value) {},
                ),
                ...PatientEnum.values.map(
                  (final e) => ChoiceChip(
                    label: Text(e.toString()),
                    selected: false,
                    onSelected: (final value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList.list(
          children: [
            for (var i = 0; i < 10; i++)
              Card.filled(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                shape: const RoundedSuperellipseBorder(
                  borderRadius: AppBorders.xxs,
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(),
                  title: Text('Patient $i'),
                  subtitle: Text('32 years | Male\nLast visit: $i days ago'),
                  trailing: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: PatientEnum
                          .values[i % PatientEnum.values.length]
                          .color
                          .withAlpha(50),
                      shape: const RoundedSuperellipseBorder(
                        borderRadius: AppBorders.xxxs,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        PatientEnum.values[i % PatientEnum.values.length]
                            .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: PatientEnum
                              .values[i % PatientEnum.values.length]
                              .color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    ),
  );
}
