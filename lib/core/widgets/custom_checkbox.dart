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
      width: 20,
      height: 20,
      duration: const Duration(milliseconds: 300),
      decoration: ShapeDecoration(
        color: isChecked ? AppColors.primary : null,
        shape: RoundedSuperellipseBorder(
          side: isChecked
              ? BorderSide.none
              : const BorderSide(width: 2, color: AppColors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
      ),
      child: isChecked
          ? Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset(
                Assets.assetsImagesCheckMark,
                colorFilter: ColorFilter.mode(
                  AppColors.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            )
          : null,
    ),
  );
}
