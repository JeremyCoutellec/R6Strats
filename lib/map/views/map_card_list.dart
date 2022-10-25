import 'package:flutter/material.dart';

import '../map_r6_model.dart';
import 'map_show.dart';

class MapCardList extends StatefulWidget {
  final List<MapR6> maps;
  MapR6? showViewMapR6;

  MapCardList({super.key, required this.maps, this.showViewMapR6});

  @override
  State<MapCardList> createState() => _MapCardListState();
}

class _MapCardListState extends State<MapCardList> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        body: GridView.builder(
            padding: const EdgeInsets.only(left: 20, right: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.landscape ? 4 : 2),
            itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MapShow(map: widget.maps[index]))),
                child: Card(
                    child: Column(children: <Widget>[
                  AspectRatio(
                      aspectRatio: 1.4,
                      child: Image.asset(widget.maps[index].icon ?? '')),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: Text(widget.maps[index].name,
                              textAlign: TextAlign.center)))
                ]))),
            itemCount: widget.maps.length));
  }
}
