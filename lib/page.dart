import 'package:flutter/material.dart';
import 'core/views/nav_bar.dart';

class PageCompanion extends StatefulWidget {
  final Widget child;
  bool withoutTabBottom = false;

  PageCompanion(
      {super.key, required this.child, this.withoutTabBottom = false});

  @override
  State<PageCompanion> createState() => _PageState();
}

class _PageState extends State<PageCompanion> {
  @override
  Widget build(BuildContext context) {
    if (widget.withoutTabBottom) {
      return Scaffold(
        appBar:
            NavBar(context: context, withoutTabBottom: widget.withoutTabBottom),
        body: widget.child,
      );
    }
    return DefaultTabController(
        length: NavBar(context: context).tabs.length,
        child: Scaffold(
          appBar: NavBar(context: context),
          body: widget.child,
        ));
  }
}
