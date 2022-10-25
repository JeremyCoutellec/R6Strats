import 'package:flutter/material.dart';

class NavBar extends AppBar {
  PreferredSizeWidget? bottomNavbar;
  String? titleNavBar;

  NavBar(
      {super.key,
      required BuildContext context,
      this.bottomNavbar,
      this.titleNavBar})
      : super(
            title: Row(children: [
              Image.asset(
                'images/r6companionLogo.png',
                height: 23,
              ),
              Text(titleNavBar ?? 'R6 Strats Builder',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ))
            ]),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: bottomNavbar,
            actions: []);
}
