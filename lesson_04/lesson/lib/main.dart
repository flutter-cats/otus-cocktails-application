import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson/theme/material.dart';
import 'package:lesson/visible_widgets/text.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) {
      return MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: materialSampleThemeData,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Material(
          child: DevicePreview.appBuilder(context, child),
        );
      },
      home: TextSample(),
    );
  }
}
