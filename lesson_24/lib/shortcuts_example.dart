import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortcutsExample extends StatelessWidget {
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
          child: _SimpleFormContent(),
        ),
      ),
    );
  }
}

class _SimpleFormContent extends StatefulWidget {
  const _SimpleFormContent({Key? key}) : super(key: key);

  @override
  __SimpleFormContentState createState() => __SimpleFormContentState();
}

class __SimpleFormContentState extends State<_SimpleFormContent> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyS,
        ): _SaveIntent()
      },
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
