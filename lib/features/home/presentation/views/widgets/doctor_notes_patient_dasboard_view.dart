import 'package:flutter/material.dart'
    show
        Card,
        Column,
        CrossAxisAlignment,
        Icon,
        IconAlignment,
        Icons,
        ListTile,
        MainAxisSize,
        SizedBox,
        SnackBar,
        StatelessWidget,
        TextButton;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider;
import '../../../../../core/constants/borders.dart';
import '../../../../../core/helpers/custom_show_snackBar.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import '../../../../notes/domain/entities/note_entity.dart';
import '../../../../notes/presentation/controllers/get_notes_cubit/get_notes_cubit.dart';
import 'notes_card_patient_dashboard.dart';

class DoctorNotesPatientDasboardView extends StatelessWidget {
  DoctorNotesPatientDasboardView({super.key});
  List<NoteEntity>? notes;
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (_) => GetNotesCubit(getUser?.id ?? 0),
    child: BlocConsumer<GetNotesCubit, GetNotesState>(
      listener: (final context, final state) {
        if (state is GetNotesLoading) {
        } else if (state is GetNotesSuccess) {
          notes = state.notes;
        } else {
          customShowSnackBar(
            context: context,
            message: 'Cannot fetch the notes.',
          );
        }
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
                  leading: Icon(Icons.notes_rounded, color: AppColors.white),
                  title: IText('Doctor Notes'),
                  tileColor: AppColors.waterBlue,
                  textColor: AppColors.white,
                ),
                if (notes == null || notes!.isEmpty)
                  const SizedBox(
                    height: 100,
                    child: Center(child: Text('No Notes  found')),
                  )
                else
                  NoteCardPatientDashboard(note: notes![0], index: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton.icon(
                    onPressed: () async {
                      await AppRoutes.doctorNotesPatientDasboard(
                        context,
                        notes: notes ?? [],
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    label: const IText('Read More!'),
                    iconAlignment: IconAlignment.end,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.waterBlue,
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
