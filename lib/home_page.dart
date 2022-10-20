import 'package:flutter/material.dart';
import './page.dart';
import 'agent/controller/agent_controller.dart';
import 'map/controller/map_controller.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageCompanion(
        child: const TabBarView(children: [
      MapController(),
      Text('strats list WIP'),
      AgentController()
    ]));
  }
}
