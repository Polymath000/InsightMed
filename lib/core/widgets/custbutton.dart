import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({required this.btnText, required this.onTap, super.key});
  final String? btnText;
  final void Function()? onTap;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
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
        child: Text(widget.btnText ?? ''),
      ),
    ),
  );
}
