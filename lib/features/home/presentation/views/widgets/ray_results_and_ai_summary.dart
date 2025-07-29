import 'package:flutter/material.dart'
    show
        BuildContext,
        Card,
        Center,
        Clip,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Icon,
        IconAlignment,
        Icons,
        ListTile,
        MainAxisSize,
        Padding,
        RoundedSuperellipseBorder,
        ScaffoldMessenger,
        SizedBox,
        SliverPadding,
        SliverToBoxAdapter,
        SnackBar,
        StatelessWidget,
        Text,
        TextButton,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider;

import '../../../../../core/constants/borders.dart';
import '../../../../../core/entities/ray_entity.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import '../../../../rays/cubit/get_rays/get_rays_cubit.dart';
import '../../../../rays/presentation/view/widget/ray_card.dart';

class RayResultsAndAiSummary extends StatelessWidget {
  RayResultsAndAiSummary({super.key});
  List<RayEntity>? rays;
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => GetRaysCubit(),
    child: BlocConsumer<GetRaysCubit, GetRaysState>(
      listener: (final context, final state) {
        if (state is GetRaysFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot fetch the Rays.')),
          );
        } else if (state is GetRaysSuccess) {
          rays = state.rays;
        } else if (state is GetRaysLoadding) {}
      },
      builder: (final context, final state) => SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverToBoxAdapter(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: const RoundedSuperellipseBorder(
              borderRadius: AppBorders.xxs,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.medical_services_rounded,
                    color: AppColors.white,
                  ),
                  title: Text('Ray Results & AI Summary'),
                  tileColor: AppColors.topaz,
                  textColor: AppColors.white,
                ),
                if (rays == null || rays!.isEmpty)
                  const SizedBox(
                    height: 100,
                    child: Center(child: Text('No Rays Found')),
                  )
                else
                  RayCard(ray: rays![0], index: 0 + 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton.icon(
                    onPressed: () async {
                      await AppRoutes.rayResultsPatientDashboard(
                        context,
                        rays: rays ?? [],
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    label: const IText('View all results'),
                    iconAlignment: IconAlignment.end,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.topaz,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
