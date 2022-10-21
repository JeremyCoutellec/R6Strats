import 'package:flutter/material.dart';
import '../models/agent.dart';
import 'agent_show.dart';

class AgentCardList extends StatelessWidget {
  final List<Agent> agents;
  Agent? showViewAgent;

  AgentCardList({super.key, required this.agents, this.showViewAgent});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return GridView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.landscape ? 6 : 3),
        itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AgentShow(agent: agents[index]))),
            child: Card(
                child: Column(children: <Widget>[
              AspectRatio(
                  aspectRatio: 1.4,
                  child: Image.asset(agents[index].icon ?? '')),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Text(agents[index].name,
                          textAlign: TextAlign.center)))
            ]))),
        itemCount: agents.length);
  }
}
