import 'package:flutter/material.dart';

Widget decorationWidget({required final List<Widget> children}) => Card(
  child: Padding(
    padding: const EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  ),
);
