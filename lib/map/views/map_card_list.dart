import 'package:flutter/material.dart';
import '../models/map.dart';
import 'map_show.dart';

class MapCardList extends StatelessWidget {
  final List<Map> maps;

  const MapCardList({super.key, required this.maps});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MapShow(map: maps[index]))),
            child: Card(
                child: Column(children: <Widget>[
              AspectRatio(
                aspectRatio: 1.3,
                child: Image.network(maps[index].cover, fit: BoxFit.fitHeight),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child:
                          Text(maps[index].name, textAlign: TextAlign.center)))
            ]))),
        itemCount: maps.length);
  }
}
