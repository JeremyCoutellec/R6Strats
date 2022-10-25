import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

import 'core/views/nav_bar.dart';
import 'agent/agent_controller.dart';
import 'map/map_r6_controller.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 2,
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
    return Scaffold(
        appBar: NavBar(context: context),
        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Maps",
          labels: const ["Maps", "Agents"],
          icons: const [Icons.map, Icons.people],
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
          physics:
              const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          children: const <Widget>[MapR6Controller(), AgentController()],
        ));
  }
}
