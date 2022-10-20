import 'package:flutter/material.dart';
import '../models/agent.dart';
import 'agent_show.dart';

class AgentCardList extends StatelessWidget {
  final List<Agent> agents;

  const AgentCardList({super.key, required this.agents});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    AgentShow(agent: agents[index]))),
            child: Card(
                child: Column(children: <Widget>[
              AspectRatio(
                aspectRatio: 1.4,
                child: Image.network(agents[index].cover),
              ),
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
