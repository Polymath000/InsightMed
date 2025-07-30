import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/get_appiontment_cubit/get_appiontment_cubit.dart';
import 'widgets/appts_view_bloc_builder.dart';

class ApptsView extends StatelessWidget {
  const ApptsView({required this.email, super.key});
  final String email;
  @override
  Widget build(final BuildContext context) => BlocProvider<GetAppiontmentCubit>(
    create: (final context) => GetAppiontmentCubit(email),
    child: const ApptsViewBlocBuilder(),
  );
}
