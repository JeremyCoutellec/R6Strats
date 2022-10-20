import 'package:flutter/material.dart';
import '../models/agent.dart';

class AgentShow extends StatelessWidget {
  final Agent agent;

  const AgentShow({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: 300,
        height: 100,
        child: Center(child: Text(agent.name)),
      ),
    ));
  }
}
