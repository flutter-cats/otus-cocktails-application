import 'package:flutter/material.dart';

import 'list/list_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
      ),
    ),
    home: ListViewSamplePage(),
  ));
}
