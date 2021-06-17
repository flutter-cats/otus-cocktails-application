import 'package:flutter/material.dart';

class FeaturesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 30, color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SelectableText("Ordinary text (Roboto)"),
                const SizedBox(height: 16),
                SelectableText(
                  "Custom font: orange juice",
                  style: TextStyle(fontFamily: "orange juice"),
                ),
                const SizedBox(height: 16),
                SelectableText("Emoji: 🇬🇧 🏝 🤔 👩‍🚒"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
