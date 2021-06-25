import 'dart:html' as html;

// import 'package:universal_html/html.dart' as html;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
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
          child: _WebVideoPlayer(),
        ),
      ),
    );
  }
}

class _WebVideoPlayer extends StatefulWidget {
  const _WebVideoPlayer({Key? key}) : super(key: key);

  @override
  _WebVideoPlayerState createState() => _WebVideoPlayerState();
}

class _WebVideoPlayerState extends State<_WebVideoPlayer> {
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

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder desktopBuilder;
  final WidgetBuilder mobileBuilder;

  const ResponsiveBuilder({
    Key? key,
    required this.desktopBuilder,
    required this.mobileBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600 ?
              mobileBuilder(context) :
              desktopBuilder(context);
      },
    );
  }
}
