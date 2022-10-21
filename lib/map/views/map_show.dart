import 'package:flutter/material.dart';
import '../../core/views/nav_bar.dart';
import '../models/map.dart';
import '../models/views.dart';

class MapShow extends StatelessWidget {
  final Map map;

  const MapShow({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: map.views.length,
        child: Scaffold(
          appBar: NavBar(
              context: context,
              titleNavBar: map.name,
              bottomNavbar: TabBar(
                  tabs: map.views.map((View view) {
                return Tab(child: Text(view.name));
              }).toList())),
          body: Center(
              child: TabBarView(
                  children: map.views.map((View view) {
            return InteractiveViewer(
                panEnabled: false,
                minScale: 0.5,
                maxScale: 2,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                      view.cover,
                      fit: BoxFit.fitHeight,
                    )));
          }).toList())),
        ));
  }
}
