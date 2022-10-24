import 'package:flutter/material.dart';
import '../../core/views/nav_bar.dart';
import '../agent_model.dart';

class AgentShow extends StatelessWidget {
  final Agent agent;

  const AgentShow({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(
            context: context, titleNavBar: agent.name, withoutTabBottom: true),
        body: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        Image.asset(
                          agent.icon ?? '',
                          height: 70,
                        ),
                        Image.asset(
                          agent.cover ?? '',
                          height: MediaQuery.of(context).size.height / 3,
                        )
                      ],
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Santé',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                        Row(children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: agent.health == Health.high ||
                                          agent.health == Health.middle
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.secondary,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: agent.health == Health.high
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.secondary,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ])
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Vitesse',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                        Row(children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: agent.speed == Speed.high ||
                                          agent.speed == Speed.middle
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.secondary,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: agent.speed == Speed.high
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.secondary,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ])
                      ],
                    )),
                if (agent.difficulty is Difficulty)
                  Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            'Difficulté',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )),
                          Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 10.0,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: agent.health == Health.high ||
                                            agent.health == Health.middle
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    width: 10.0,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: agent.health == Health.high
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    width: 10.0,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ))
              ],
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: const Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    child: Text('Camp', textAlign: TextAlign.center))),
            Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  Agent.getStringOfSide(agent.side) ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: const Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    child: Text('Roles', textAlign: TextAlign.center))),
            Column(
                children: agent.roles
                    .map<Widget>((role) => Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          Agent.getStringOfRole(role) ?? '',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )))
                    .toList()),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: const Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    child: Text('Description', textAlign: TextAlign.center))),
            Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  agent.description ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ))
          ],
        ));
  }
}
