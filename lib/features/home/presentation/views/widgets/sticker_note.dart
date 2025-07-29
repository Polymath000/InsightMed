import 'package:flutter/material.dart' show Icons, StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import '../../../../notes/domain/entities/note_entity.dart';
import 'decorated_icon.dart' show DecoratedIcon;
import 'home_sticker.dart';

class StickerNote extends StatelessWidget {
  const StickerNote({required this.notes, super.key});
  final List<NoteEntity>? notes;
  @override
  Widget build(final BuildContext context) {
    final lastNote = (notes?.isNotEmpty ?? false) ? notes!.last : null;
    final isNotEmpty = notes?.isNotEmpty ?? false;
    final color = isNotEmpty ? AppColors.waterBlue : AppColors.grey;
    return HomeSticker(
      headerIcon: Icons.notes_rounded,
      headerTitle: 'Doctor Notes',
      headerColor: color,
      bodyLeading: DecoratedIcon(
        icon: Icons.calendar_month_rounded,
        color: color,
      ),
      bodyTitle: 'Follow-up appointment notes',
      bodySubTitle: IText(
        isNotEmpty
            ? DateFormat.yMMMd().format(lastNote?.createdAt ?? DateTime.now())
            : 'No notes yet',
      ),
      paragraph: IText(
        lastNote?.note ??
            'The doctor has not yet uploaded any notes for your follow-up.',
        softWrap: true,
      ),
      footerOnPressed: isNotEmpty
          ? () => AppRoutes.doctorNotesPatientDasboard(context, notes: notes!)
          : null,
      footerTitle: 'Read More',
    );
  }
}
