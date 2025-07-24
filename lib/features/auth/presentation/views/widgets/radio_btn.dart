import 'package:flutter/material.dart';

enum SingingCharacter { male, female }

class RadioBtn extends StatefulWidget {
  const RadioBtn({required this.onChanged, super.key});
  final void Function(String?)? onChanged;
  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  SingingCharacter? _character = SingingCharacter.male;

  @override
  Widget build(final BuildContext context) => Row(
    children: <Widget>[
      Flexible(
        child: RadioListTile(
          title: const Text('Male'),
          value: SingingCharacter.male,
          groupValue: _character,
          onChanged: (final value) {
            setState(() => _character = value);
            widget.onChanged?.call(value?.toString().split('.').last);
          },
        ),
      ),
      Flexible(
        child: RadioListTile(
          title: const Text('Female'),
          value: SingingCharacter.female,
          groupValue: _character,
          onChanged: (final value) {
            setState(() {
              _character = value;
            });
            widget.onChanged?.call(value?.toString().split('.').last);
          },
        ),
      ),
    ],
  );
}
