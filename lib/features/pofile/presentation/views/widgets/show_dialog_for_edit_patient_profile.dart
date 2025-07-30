import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/app_media_query.dart';
import '../../../../../core/helpers/custom_show_snack_bar.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/profile_of_patient_/profile_of_patient_cubit.dart';

Future<dynamic> showDialogForEditPatientProfile(
  final BuildContext context, {
  required final UserEntity user,
  required final void Function({bool? isLoading})? onChanged,
}) => showDialog(
  context: context,
  builder: (_) => AlertDialog(
    title: const Text('Are you sure?'),
    content: BlocProvider(
      create: (final context) => ProfileOfPatientCubit(),
      child: Builder(
        builder: (final context) =>
            BlocBuilder<ProfileOfPatientCubit, ProfileOfPatientState>(
              builder: (final context, final state) {
                if (state is ProfileOfPatientFailure) {
                  onChanged!(isLoading: false);
                  customShowSnackBar(message: state.message, context: context);
                } else if (state is ProfileOfPatientSuccess) {
                  onChanged!(isLoading: false);
                } else if (state is ProfileOfPatientLoading) {
                  onChanged!(isLoading: true);
                }
                return SizedBox(
                  width: AppMediaQuery.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          label: const Text('Yes'),
                          onPressed: () async {
                            await BlocProvider.of<ProfileOfPatientCubit>(
                              context,
                            ).updatePatientDetails(user: user);
                            user
                              ..copyWith(password: getUser?.password)
                              ..copyWith(
                                passwordConfirmation:
                                    getUser?.passwordConfirmation,
                              )
                              ..copyWith(id: getUser?.id)
                              ..copyWith(specialty: getUser?.specialty);
                            if (context.mounted) {
                              AppRoutes.pop(context);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.blueAccent,
                            side: const BorderSide(color: Colors.blueAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            elevation: 0,
                          ),
                          icon: const Icon(Icons.close),
                          label: const Text('Cancel'),
                          onPressed: () {
                            AppRoutes.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      ),
    ),
  ),
);
