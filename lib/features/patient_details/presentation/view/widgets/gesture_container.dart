import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';

class GestureContainer extends StatefulWidget {
  const GestureContainer({
    required this.index,
    required this.bIndex,
    required this.title,
    required this.onSelected,
    super.key,
  });
  final int index;
  final int bIndex;
  final String title;
  final ValueChanged<int> onSelected;

  @override
  State<GestureContainer> createState() => _GestureContainerState();
}

class _GestureContainerState extends State<GestureContainer> {
  @override
  Widget build(final BuildContext context) {
    var index = widget.index;
    final isSelected = index == widget.bIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          index = widget.bIndex;
          widget.onSelected(widget.bIndex);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cyan : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.cyan : AppColors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            widget.title,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
