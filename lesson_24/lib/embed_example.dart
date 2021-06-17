import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class EmbedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
            ),
          ),
          child: _Example(),
        ),
      ),
    );
  }
}

class _Example extends StatefulWidget {
  const _Example({Key? key}) : super(key: key);

  @override
  __ExampleState createState() => __ExampleState();
}

class __ExampleState extends State<_Example> {
  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      "video",
      (int viewId) => html.IFrameElement()
        ..width = "720"
        ..height = "405"
        ..src = "https://www.youtube.com/embed/b_sQ9bMltGU?&autoplay=1&rel=0"
        ..style.border = "none"
        ..allow = "accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        ..allowFullscreen = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 720,
      height: 405,
      child: HtmlElementView(
        viewType: "video",
      ),
    );
  }
}
