import 'dart:convert';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

import 'map_r6_model.dart';

class MapR6Actions {
  Future<List<MapR6>> getMaps() async {
    final String mockMaps = await rootBundle.loadString('assets/mockMaps.json');
    List<dynamic> dataList = await jsonDecode(mockMaps);
    return dataList.map((element) => MapR6.fromJson(element)).toList();
  }

  // Future<List<Map>> getMapsGameTactic() async {
  //   final client = http.Client();
  //   final url = Uri.parse('https://static.gametactic.eu/r6/maps/data.json');
  //   final clientResponse = await client.get(url);
  //   List<dynamic> dataList = jsonDecode(clientResponse.body);
  //   return dataList.map((element) {
  //     List<View> views = element['views']
  //         ?.map<View>((view) => View(
  //             id: view['id'], name: view['name'], image: view['image']['src']))
  //         .toList();

  //     return Map(
  //         name: element['name'],
  //         description: element['description'],
  //         cover: element['cover']['src'],
  //         views: views);
  //   }).toList();
  // }
}
