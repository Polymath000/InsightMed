import 'package:flutter/material.dart';

import '../../../../../core/enums/gender_enum.dart';
import '../../../../../core/utls/i_text.dart' show IText;

class RadioBtn extends StatefulWidget {
  const RadioBtn({required this.onChanged, super.key});
  final void Function(String?)? onChanged;

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  GenderEnum character = GenderEnum.male;
  @override
  Widget build(final BuildContext context) => Row(
    children: GenderEnum.values
        .map(
          (final e) => Flexible(
            child: RadioListTile(
              value: e,
              groupValue: character,
              onChanged: (final value) {
                setState(() => character = value!);
                widget.onChanged?.call(value?.toString());
              },
              title: IText(e.toString()),
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
          ),
        )
        .toList(),
  );
}
