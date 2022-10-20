import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/map.dart';
import '../models/views.dart';

class MapActions {
  Future<List<Map>> getMaps() async {
    final client = http.Client();
    final url = Uri.parse('https://static.gametactic.eu/r6/maps/data.json');
    final clientResponse = await client.get(url);
    List<dynamic> dataList = jsonDecode(clientResponse.body);
    return dataList.map((element) {
      List<View> views = element['views']
          ?.map<View>((view) => View(
              id: view['id'], name: view['name'], image: view['image']['src']))
          .toList();

      return Map(
          name: element['name'],
          description: element['description'],
          cover: element['cover']['src'],
          views: views);
    }).toList();
    ;
  }
}
