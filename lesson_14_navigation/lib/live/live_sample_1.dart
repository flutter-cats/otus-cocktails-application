import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: (settings) {
      //todo реализовать открытие TitlePage
    },
    home: RootScreen(),
  ));
}

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RootScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () => _openPage1(context),
                child: Text('Open Page 1')),
            TextButton(
                onPressed: () => _openPage2(context),
                child: Text('Open Page 2')),
            TextButton(
                onPressed: () => _replace(context), child: Text('Replace')),
          ],
        ),
      ),
    );
  }

  void _openPage1(BuildContext context) {
    //todo открыть TitlePage используюя Navigator.push
  }

  void _openPage2(BuildContext context) {
    //todo открыть TitlePage используюя Navigator.pushNamed
  }

  void _replace(BuildContext context) {
    //todo открыть TitlePage используюя Navigator.pushReplacement
  }
}

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TitlePage'),
      ),
    );
  }
}
