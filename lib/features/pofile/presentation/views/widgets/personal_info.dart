import 'package:flutter/material.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/enums/gender_enum.dart';
import '../../../../../core/widgets/app_text_field.dart' show AppTextField;
import '../../../../auth/presentation/views/widgets/radio_btn.dart';

class PersonalContainer extends StatelessWidget {
  const PersonalContainer({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(final BuildContext context) => Column(
    children: [
      AppTextField(
        labelText: 'Full Name',
        hintText: 'Enter your full name',
        prefixIcon: Icon(Icons.person_2_outlined),
        intialVlue: user.getName,
      ),
      AppTextField(
        labelText: 'Age',
        hintText: 'Enter your age',
        prefixIcon: Icon(Icons.calendar_month_outlined),
        keyboardType: TextInputType.number,
        intialVlue: user.age,
      ),
      RadioBtn(
        character: user.gender == 'male' ? GenderEnum.male : GenderEnum.female,
        onChanged: (_) {},
      ),
    ],
  );
}
