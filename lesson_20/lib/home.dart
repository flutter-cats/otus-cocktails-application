import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Open Stateful App'),
                style: TextButton.styleFrom(primary: Colors.blueGrey),
                onPressed: () => Navigator.of(context).pushNamed('stful_app'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Open Simple App'),
                style: TextButton.styleFrom(primary: Colors.green),
                onPressed: () => Navigator.of(context).pushNamed('simple_app'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Open Dev Simple App'),
                style: TextButton.styleFrom(primary: Colors.lightGreen),
                onPressed: () =>
                    Navigator.of(context).pushNamed('simple_app_dev'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Open Complex App'),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () => Navigator.of(context).pushNamed('complex_app'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
