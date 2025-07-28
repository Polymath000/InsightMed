import 'package:flutter/material.dart';

class ApptsView extends StatelessWidget {
  const ApptsView({super.key});

  @override
  Widget build(final BuildContext context) => const Card.filled(
    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    child: ListTile(
      minTileHeight: 84,
      leading: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              Text('Jul'),
              Text(
                '05',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      title: Text('10:30 AM - 11:15 AM'),
    ),
  );
}
