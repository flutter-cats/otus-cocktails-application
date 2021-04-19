import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class SecondPage extends StatelessWidget {
  final Ticker ticker;
  const SecondPage({
    Key? key,
    required this.ticker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Second Page',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

///
/// SingleTickerProviderStateMixin позволяет нам получить доступ к Ticker
///
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late DateTime _startTime;
  String _currentTime = 'empty';
  Ticker? _ticker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animations - Ticker based'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Column(children: [
            Text(_currentTime),
            ElevatedButton(
              child: Text('Second Page'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return SecondPage(ticker: _ticker!);
                }));
              },
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _ticker?.dispose();
  }

  @override
  void initState() {
    super.initState();

    _startTime = DateTime.now();

    _ticker?.dispose();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentTime = _startTime.toString();
        _currentTime = (_startTime.add(elapsed)).toString();
      });
    });

    print('init state');
    print('isActive: ${_ticker?.isActive}');
    print('isTicking: ${_ticker?.isTicking}');

    _ticker!.start();

    print('after starting the ticker');
    print('isActive: ${_ticker?.isActive}');
    print('isTicking: ${_ticker?.isTicking}');
  }
}
