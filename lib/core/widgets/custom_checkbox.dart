import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utls/app_images.dart';
import '../utls/themes/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({required this.onChanged, super.key});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: () {
      setState(() {
        isChecked = !isChecked;

        widget.onChanged(isChecked);
      });
    },
    child: AnimatedContainer(
      width: 22,
      height: 22,
      duration: const Duration(milliseconds: 100),
      decoration: ShapeDecoration(
        color: isChecked ? AppColors.green : Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: AppColors.grey),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: isChecked
          ? Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset(Assets.assetsImagesCheckMark),
            )
          : const SizedBox(width: 24, height: 24, child: SizedBox.shrink()),
    ),
  );
}
