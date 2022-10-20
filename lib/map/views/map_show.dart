import 'package:flutter/material.dart';
import '../models/map.dart';

class MapShow extends StatelessWidget {
  final Map map;

  const MapShow({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: 300,
        height: 100,
        child: Text(map.name),
      ),
    ));
  }
}
