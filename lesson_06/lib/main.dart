import 'package:flutter/material.dart';
import 'package:lesson_05/scroll_controller/fixed_extend_scroll_controller.dart';
import 'package:lesson_05/scroll_controller/tracking_scroll.dart';
import 'package:lesson_05/slivers/sliver_flexible_space.dart';
import 'package:lesson_05/slivers/sliver_header.dart';

import 'list/grid_view.dart';
import 'list/list_view.dart';
import 'list/page_view.dart';
import 'scroll_controller/scroll_controller.dart';
import 'scroll_view/single_child_scroll_view.dart';
import 'slivers/sliver_list_grid.dart';

//списки: ListView. GridView. PageView. CustomScroll;
//SliverGridView. SliverListView. FlexibleSpace.SliverAppBar.

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(button: TextStyle(color: Colors.white)))),
    home: ListViewSamplePage(),
  ));
}
