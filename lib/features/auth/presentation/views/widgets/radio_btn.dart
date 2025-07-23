import 'package:flutter/material.dart';

enum SingingCharacter { male, female, other }

class RadioBtn extends StatefulWidget {
  const RadioBtn({super.key, required this.onChanged});
  final void Function(String?)? onChanged;
  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  SingingCharacter? _character = SingingCharacter.male;

  @override
  Widget build(final BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Row(
        children: [
          Radio<SingingCharacter>(
            value: SingingCharacter.male,
            groupValue: _character,
            onChanged: (final value) {
              setState(() {
                _character = value;
              });
              widget.onChanged?.call(value?.toString().split('.').last);
            },
          ),
          const Text('Male'),
        ],
      ),
      Row(
        children: [
          Radio<SingingCharacter>(
            value: SingingCharacter.female,
            groupValue: _character,
            onChanged: (final value) {
              setState(() {
                _character = value;
              });
              widget.onChanged?.call(value?.toString().split('.').last);
            },
          ),
          const Text('Female'),
        ],
      ),
    ],
  );
}
