import 'package:flutter/cupertino.dart';
import 'package:r6_companion/agent/views/agent_card_list.dart';

import '../actions/agent.dart';
import '../models/agent.dart';

class AgentController extends StatelessWidget {
  const AgentController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Agent>>(
        future: AgentActions().getAgents(),
        builder: (context, snapshot) =>
            AgentCardList(agents: snapshot.data ?? []));
  }
}
