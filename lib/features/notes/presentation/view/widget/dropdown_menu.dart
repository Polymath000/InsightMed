import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/enums/patient_enum.dart';
import '../../../../../core/repos/user_repo.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../home/presentation/views/widgets/patiend_status_text.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({required this.patient, super.key});
  final UserEntity patient;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late PatientStatusEnum? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.patient.status;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => TextButton(
    style: TextButton.styleFrom(foregroundColor: _selectedItem?.color),
    onPressed: () => DropDownState<PatientStatusEnum>(
      dropDown: DropDown<PatientStatusEnum>(
        data: PatientStatusEnum.values
            .map((final e) => SelectedListItem<PatientStatusEnum>(data: e))
            .toList(),
        onSelected: (final selectedItems) async {
          if (selectedItems.isNotEmpty) {
            setState(() => _selectedItem = selectedItems.first.data);
            await getIt<UserRepo>().addPatientsStatusToApi(
              widget.patient.copyWith(status: _selectedItem),
            );
          }
        },
      ),
    ).showModal(context),
    child: PatiendStatusText(
      status: _selectedItem ?? PatientStatusEnum.newPatient,
    ),
  );
}
