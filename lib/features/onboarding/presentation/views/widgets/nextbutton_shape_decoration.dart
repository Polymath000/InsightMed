import 'package:flutter/material.dart';

ShapeDecoration get nextbuttonShapeDecoration => ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0, 0.50),
    end: Alignment(1, 0.50),
    colors: [Color(0xFF0891B2), Color(0xFF2563EB)],
  ),
  shape: RoundedRectangleBorder(
    side: const BorderSide(color: Color(0xFFE5E7EB)),
    borderRadius: BorderRadius.circular(9999),
  ),
  shadows: const [
    BoxShadow(color: Color(0x19000000), blurRadius: 15, offset: Offset(0, 10)),
    BoxShadow(color: Color(0x19000000), blurRadius: 6, offset: Offset(0, 4)),
  ],
);
