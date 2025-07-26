import 'package:flutter/material.dart';

import '../../../../../core/enums/gender_enum.dart';
import '../../../../../core/utls/i_text.dart' show IText;

class RadioBtn extends StatefulWidget {
  RadioBtn({
    required this.onChanged,
    super.key,
    this.character = GenderEnum.male,
  });
  final void Function(String?)? onChanged;
  GenderEnum? character;

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  @override
  Widget build(final BuildContext context) => Row(
    children: GenderEnum.values
        .map(
          (final e) => Flexible(
            child: RadioListTile(
              value: e,
              groupValue: widget.character,
              onChanged: (final value) {
                setState(() => widget.character = value);
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
