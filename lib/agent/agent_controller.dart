import 'package:flutter/cupertino.dart';
import 'package:r6_companion/agent/views/agent_card_list.dart';

import 'agent_actions.dart';
import 'agent_model.dart';

class AgentController extends StatelessWidget {
  const AgentController({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Agent>>(
        future: AgentActions().getAgents(),
        builder: (context, snapshot) =>
            AgentCardList(agents: snapshot.data ?? []));
  }
}
