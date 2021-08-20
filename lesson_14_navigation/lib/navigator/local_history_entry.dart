import 'package:flutter/material.dart';

class LocalHistoryApp extends StatelessWidget {
  const LocalHistoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomePage(),
        '/second_page': (BuildContext context) => const SecondPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('HomePage'),
            // Press this button to open the SecondPage.
            ElevatedButton(
              child: const Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/second_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _showRectangle = false;

  @override
  Widget build(BuildContext context) {
    final localNavContent = _showRectangle
        ? Container(
            width: 100.0,
            height: 100.0,
            color: Colors.red,
          )
        : ElevatedButton(
            child: const Text('Show Rectangle'),
            onPressed: _navigateLocallyToShowRectangle,
          );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            localNavContent,
          ],
        ),
      ),
    );
  }

  Future<void> _navigateLocallyToShowRectangle() async {
    setState(() => _showRectangle = true);
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      // Hide the red rectangle.
      setState(() => _showRectangle = false);
    }));
  }
}
