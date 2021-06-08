import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/aplication/adaptive_app_bar.dart';
import 'package:lesson_21_animations_homework/ui/aplication/adaptive_navigation_bar.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_drawer.dart';

class ApplicationScaffold extends StatelessWidget {
  final Widget child;
  final int currentSelectedNavBarItem;
  final String title;

  ApplicationScaffold({
    required this.child,
    required this.currentSelectedNavBarItem,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AdaptiveAppBar(title: title),
        drawer: ApplicationDrawer(),
        body: child,
        bottomNavigationBar: ApplicationNavigationBar(
          currentSelectedItem: currentSelectedNavBarItem,
        ),
      ),
    );
  }
}
