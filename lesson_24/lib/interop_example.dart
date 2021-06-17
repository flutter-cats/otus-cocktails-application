import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'interop/js_utils.dart';

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
          // child: _CallMethodExample(),
          // child: _ExternalExample(),
          child: _DisabledShortcutExample(),
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

class _DisabledShortcutExample extends StatefulWidget {
  const _DisabledShortcutExample({Key? key}) : super(key: key);

  @override
  __DisabledShortcutExampleState createState() => __DisabledShortcutExampleState();
}

class __DisabledShortcutExampleState extends State<_DisabledShortcutExample> {
  @override
  void initState() {
    super.initState();

    disableSaveShortcut();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS): _SaveIntent()},
      child: Actions(
        actions: {_SaveIntent: _SubmitFormAction()},
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(),
              const SizedBox(height: 24),
              TextField(),
              const SizedBox(height: 42),
              ElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveIntent extends Intent {}

class _SubmitFormAction extends Action<_SaveIntent> {
  @override
  Object? invoke(covariant _SaveIntent intent) {
    print("Save");
  }
}
