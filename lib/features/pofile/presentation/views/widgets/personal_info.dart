import 'package:flutter/material.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/widgets/app_text_field.dart' show AppTextField;
import '../../../../auth/presentation/views/widgets/radio_btn.dart';

class PersonalContainer extends StatelessWidget {
  const PersonalContainer({super.key, this.onChanged});
  final void Function(UserEntity?)? onChanged;

  @override
  Widget build(final BuildContext context) {
    UserEntity user = getUser ?? const UserEntity();
    return Column(
      children: [
        AppTextField(
          labelText: 'Full Name',
          hintText: 'Enter your full name',
          prefixIcon: const Icon(Icons.person_2_outlined),
          intialVlue: user?.name,
          onChanged: (value) {
            user = user.copyWith(name: value);
            onChanged!(user);
          },
        ),
        AppTextField(
          labelText: 'Age',
          hintText: 'Enter your age',
          prefixIcon: const Icon(Icons.calendar_month_outlined),
          keyboardType: TextInputType.number,
          intialVlue: user?.age,
          onChanged: (value) {
            user = user.copyWith(age: value);
            onChanged!(user);
          },
        ),
        RadioBtn(
          onChanged: (value) {
            user = user.copyWith(gender: value);
            onChanged!(user);
          },
        ),
      ],
    );
  }
}
