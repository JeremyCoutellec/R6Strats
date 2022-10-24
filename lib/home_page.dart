import 'package:flutter/material.dart';
import './page.dart';
import 'agent/agent_controller.dart';
import 'map/map_r6_controller.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageCompanion(
        child: const TabBarView(children: [
      MapR6Controller(),
      Text('strats list WIP'),
      AgentController()
    ]));
  }
}
