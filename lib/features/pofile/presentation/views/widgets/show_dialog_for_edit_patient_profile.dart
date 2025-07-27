import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../cubit/profile_of_patient_/profile_of_patient_cubit.dart';

Future<dynamic> showDialogForEditPatientProfile(
  final BuildContext context, {
  required UserEntity user,
  required void Function(bool?)? onChanged

}) => showDialog(
  context: context,
  builder: (_) => AlertDialog(
    title: const Text('Are you sure?'),
    content: BlocProvider(
      create: (final context) => ProfileOfPatientCubit(),
      child: Builder(
        builder: (final context) => SizedBox(
          width: MediaQuery.sizeOf(context).width,
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
                    onChanged!(true);                    
                    await BlocProvider.of<ProfileOfPatientCubit>(
                      context,
                    ).updatePatientDetails(user: user);
                    user..copyWith(password: getUser?.password)
                    ..copyWith(
                      passwordConfirmation: getUser?.passwordConfirmation,
                    )
                    ..copyWith(id: getUser?.id)
                    ..copyWith(specialty: getUser?.specialty);
                    Navigator.pop(context);
                    
                    onChanged(true);
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
        ),
      ),
    ),
  ),
);
