import 'package:flutter/material.dart';
import '../../core/views/nav_bar.dart';
import '../map_r6_model.dart';
import '../../view/view_floor_model.dart';

class MapShow extends StatelessWidget {
  final MapR6 map;

  const MapShow({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return DefaultTabController(
        initialIndex: 0,
        length: map.views.length,
        child: Scaffold(
          appBar: NavBar(
              context: context,
              titleNavBar: map.name,
              bottomNavbar: TabBar(
                  tabs: map.views.map<Widget>((view) {
                return Tab(
                    child:
                        Text(ViewFloor.getStringFromFloor(view?.floor) ?? ''));
              }).toList())),
          body: Center(
              child: TabBarView(
                  children: map.views
                      .map((view) => InteractiveViewer(
                          panEnabled: false,
                          minScale: 0.5,
                          maxScale: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(
                                view?.image ?? '',
                                fit: BoxFit.contain,
                              ))))
                      .toList())),
        ));
  }
}
