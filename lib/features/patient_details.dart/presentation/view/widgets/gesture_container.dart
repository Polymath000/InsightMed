import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';

class GestureContainer extends StatefulWidget {
  GestureContainer({
    super.key,
    required this.index,
    required this.bIndex,
    required this.image,
    required this.title,
    required this.onSelected
  });
  int index;
  int bIndex;
  String image;
  String title;
  final ValueChanged<int> onSelected;
  @override
  State<GestureContainer> createState() => _GestureContainerState();
}

class _GestureContainerState extends State<GestureContainer> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    
    onTap: () {
      setState(() {
        widget.index = widget.bIndex;
      });
      widget.onSelected(widget.bIndex);
    },
    child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            widget.image,
            color: widget.index == widget.bIndex
                ? AppColors.info
                : AppColors.black,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          widget.title,
          style: AppTextStyles.titleMedium!.copyWith(
            color: widget.index == widget.bIndex
                ? AppColors.info
                : AppColors.black,
          ),
        ),
      ],
    ),
  );
}
