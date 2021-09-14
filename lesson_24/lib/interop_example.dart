import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'interop/js_utils.web.dart';

class InteropExample extends StatelessWidget {
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
          child: _CallMethodExample(),
          // child: _ExternalExample(),
        ),
      ),
    );
  }
}

class _CallMethodExample extends StatelessWidget {
  const _CallMethodExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        js.context.callMethod('log', ['Logged message from Flutter']);
      },
      child: Text("Log"),
    );
  }
}

class _ExternalExample extends StatelessWidget {
  const _ExternalExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        logToConsole("Logged message");
      },
      child: Text("Log 2"),
    );
  }
}
