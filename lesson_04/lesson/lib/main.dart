import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson/simplification/big_widget.dart';
import 'package:lesson/theme/material.dart';

import 'basic/blur.dart';
import 'basic/clip.dart';
import 'basic/container.dart';
import 'constrains/constrains_sample.dart';
import 'layouts/flex.dart';
import 'layouts/table.dart';
import 'media_query/media_query_sample.dart';
import 'visible_widgets/image.dart';
import 'layouts/stack.dart';
import 'layouts/wrap.dart';
import 'visible_widgets/text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: materialSampleThemeData,
      builder: (context, child) => Material(child: child),
      home: StackPage(),
    );
  }
}
