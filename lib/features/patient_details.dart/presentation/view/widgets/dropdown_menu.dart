import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';


class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {

  late String _selectedItem;
  
  final Map<String, Color> itemColors = {
    'New': Colors.green,
    'Follow-up': Colors.orange,
    'Critical': Colors.red,
    'Regular': Colors.blue,
  };
@override
  void initState() {
    _selectedItem = 'New';
    super.initState();
  }
  
  @override
  Widget build(final BuildContext context) => ElevatedButton(
    onPressed: () {
      DropDownState<String>(
        dropDown: DropDown<String>(
          data: <SelectedListItem<String>>[
            SelectedListItem<String>(data: 'New'),
            SelectedListItem<String>(data: 'Follow-up'),
            SelectedListItem<String>(data: 'Critical'),
            SelectedListItem<String>(data: 'Regular'),
          ],
          
          onSelected: (final selectedItems) {
            var list = <String>[];
            for (final item in selectedItems) {
              list.add(item.data);
            }
            setState(() {
              var temp = list.toString().substring(1);
              _selectedItem = temp.substring(0, temp.length-1);
            });
          },
        ),
      ).showModal(context);
    },
    child: Text(_selectedItem),
  );
}
