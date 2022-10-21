import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../models/agent.dart';

class AgentActions {
  Future<List<Agent>> getAgentsGameTactic() async {
    final client = http.Client();
    final url = Uri.parse('https://static.gametactic.eu/r6/entities/data.json');
    final clientResponse = await client.get(url);
    List<dynamic> dataList = jsonDecode(clientResponse.body);
    return dataList
        .map((element) => Agent(
            name: element['label'],
            description: element['caption'],
            cover: element['picture']['src'],
            icon: element['icon']['src']))
        .toList();
  }

  Future<List<Agent>> getAgents() async {
    final String mockAgents =
        await rootBundle.loadString('assets/mockAgents.json');
    List<dynamic> dataList = await jsonDecode(mockAgents);
    return dataList.map((element) => Agent.fromJson(element)).toList();
  }
}
