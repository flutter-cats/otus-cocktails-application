import 'package:flutter/material.dart';

class SimpleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore "
                  "magna aliqua. "),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: Text("Press me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
