import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CButton extends StatefulWidget {
  const CButton({
    required this.btnText,
    required this.onTap,
    super.key,
    this.colorText,
    this.image,
  });
  final String? btnText;
  final Color? colorText;
  final void Function()? onTap;
  final String? image;

  @override
  State<CButton> createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  double _scale = 1;

  void _onTapDown(final TapDownDetails details) {
    setState(() {
      _scale = 0.90;
    });
  }

  void _onTapUp(final TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: widget.onTap,
    onTapDown: _onTapDown,
    onTapUp: _onTapUp,
    onTapCancel: _onTapCancel,
    child: AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 100),
      child: FilledButton(
        onPressed: widget.onTap,
        style: FilledButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          elevation: 0,
        ),
        child: Text(widget.btnText ?? ''),
      ),
    ),
  );
}
