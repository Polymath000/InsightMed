import 'package:flutter/widgets.dart' show StatelessWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/get_user.dart';
import '../controllers/get_patients_cubit/get_patients_cubit.dart';
import '../controllers/user_dashboard_cubit/user_dashboard_cubit.dart';
import 'widgets/home_doctor_view_body.dart' show HomeDoctorViewBody;
import 'widgets/home_patient_view_body.dart' show HomePatientViewBlocBuilder;

final class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(_) => (getUser?.isDoctor() ?? false)
      ? BlocProvider(
          create: (_) => GetPatientsCubit(),
          child: const HomeDoctorViewBody(),
        )
      : BlocProvider(
          create: (_) => UserDashboardCubit(),
          child: const HomePatientViewBlocBuilder(),
        );
}
