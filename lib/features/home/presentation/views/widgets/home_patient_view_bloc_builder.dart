import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../domain/entities/dashboard_entity.dart';
import '../../controllers/user_dashboard_cubit/user_dashboard_cubit.dart';
import 'home_patient_view_body.dart';

final class HomePatientViewBlocBuilder extends StatelessWidget {
  const HomePatientViewBlocBuilder({super.key});

  @override
  BlocBuilder build(final BuildContext context) =>
      BlocBuilder<UserDashboardCubit, UserDashboardState>(
        builder: (final context, final state) {
          if (state is UserDashboardLoading) {
            return const Skeletonizer(
              child: HomePatientViewBody(dashboard: DashboardEntity()),
            );
          }
          if (state is UserDashboardSuccess) {
            return HomePatientViewBody(dashboard: state.dashboard);
          }
          if (state is UserDashboardFailure) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong'));
        },
      );
}
