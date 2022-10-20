import 'package:flutter/material.dart';
import 'core/views/nav_bar.dart';

class PageCompanion extends StatefulWidget {
  final Widget child;

  const PageCompanion({super.key, required this.child});

  @override
  State<PageCompanion> createState() => _PageState();
}

class _PageState extends State<PageCompanion> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: NarBar(context: context).tabs.length,
        child: Scaffold(
          appBar: NarBar(context: context),
          body: widget.child,
        ));
  }
}
