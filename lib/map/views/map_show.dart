import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../../core/views/nav_bar.dart';
import '../map_r6_model.dart';
import '../../view/view_floor_model.dart';

class MapShow extends StatefulWidget {
  final MapR6 map;

  const MapShow({super.key, required this.map});
  @override
  _MapShowState createState() => _MapShowState();
}

class _MapShowState extends State<MapShow> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: widget.map.views.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    List<String> tabs = widget.map.views
        .map<String>((view) => ViewFloor.getStringFromFloor(view?.floor) ?? '')
        .toList();

    return DefaultTabController(
        initialIndex: 0,
        length: tabs.length,
        child: Scaffold(
          appBar: NavBar(
            context: context,
            titleNavBar: widget.map.name,
          ),
          bottomNavigationBar: MotionTabBar(
            initialSelectedTab: tabs[0],
            labels: tabs,
            icons: widget.map.views
                .map<IconData>((view) => ViewFloor.getIconsByFloor(view?.floor))
                .toList(),
            tabSize: 50,
            tabBarHeight: 55,
            textStyle: TextStyle(
              fontSize: 12,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
            tabIconColor: Theme.of(context).primaryColor,
            tabIconSize: 28.0,
            tabIconSelectedSize: 26.0,
            tabSelectedColor: Theme.of(context).primaryColor,
            tabIconSelectedColor: Colors.white,
            tabBarColor: Colors.white,
            onTabItemSelected: (int value) {
              setState(() {
                _tabController!.index = value;
              });
            },
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: widget.map.views
                  .map((view) => Center(
                      child: InteractiveViewer(
                          panEnabled: false,
                          minScale: 0.5,
                          maxScale: 3,
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(
                                view?.image ?? '',
                                fit: BoxFit.contain,
                              )))))
                  .toList()),
        ));
  }
}
