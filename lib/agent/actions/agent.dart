import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/agent.dart';

class AgentActions {
  Future<List<Agent>> getAgents() async {
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
}
