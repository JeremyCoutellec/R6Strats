import 'package:flutter/material.dart';

class NarBar extends AppBar {
  // ignore: prefer_final_fields
  static List<String> _tabs = ['Maps', 'Strats', 'Agents'];

  List<String> get tabs => _tabs;

  NarBar({super.key, required BuildContext context})
      : super(
            leading: Image.asset('images/r6companionLogo.png'),
            title: const Text(
              'R6 Strats Builder',
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            bottom: TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                tabs: _tabs.map((item) => Tab(child: Text(item))).toList()),
            actions: []);
}
