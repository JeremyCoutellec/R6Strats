import 'package:flutter/material.dart';

class NavBar extends AppBar {
  // ignore: prefer_final_fields
  static List<String> _tabs = ['Maps', 'Strats', 'Agents'];

  List<String> get tabs => _tabs;

  bool withoutTabBottom = false;
  PreferredSizeWidget? bottomNavbar;
  String? titleNavBar;

  NavBar(
      {super.key,
      required BuildContext context,
      this.withoutTabBottom = false,
      this.bottomNavbar,
      this.titleNavBar})
      : super(
            title: Row(children: [
              Image.asset(
                'images/r6companionLogo.png',
                height: 23,
              ),
              Text(
                titleNavBar ?? 'R6 Strats Builder',
              )
            ]),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            bottom: !withoutTabBottom
                ? bottomNavbar ??
                    TabBar(
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        tabs: _tabs
                            .map((item) => Tab(child: Text(item)))
                            .toList())
                : null,
            actions: []);
}
