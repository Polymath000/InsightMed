import 'package:flutter/material.dart';
import 'shape_decoration.dart';

Widget decorationWidget({required final List<Widget> children}) => DecoratedBox(
  decoration: shapeDecoration,
  child: Container(
     width: double.infinity,
    decoration: shapeDecoration,
    padding: const EdgeInsets.all(32),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  ),
);
