import 'package:anitex/anitex.dart';
import 'package:examples/service/8.0_isolator.dart';
import 'package:examples/service/benchmark.dart';
import 'package:examples/service/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 10: Isolates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Isolates'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 39;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _runInMainIsolate() {
    bench.timeStart('Fib');
    final int fib = fibonacci(_counter);
    final int microseconds = bench.timeEnd('Fib');
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Calculate $_counter-th fib value ($fib) ended in ${(microseconds / 1000).toStringAsFixed(2)}ms')));
  }

  Future<void> _runInAnotherIsolate() async {
    bench.timeStart('Fib isolate');
    final int fib = await compute(fibonacci, _counter, debugLabel: 'Another isolate');
    final int microseconds = bench.timeEnd('Fib isolate');
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Calculate $_counter-th fib value ($fib) ended in ${(microseconds / 1000).toStringAsFixed(2)}ms')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 75,
              width: 75,
              child: CircularProgressIndicator(strokeWidth: 6),
            ),
            const SizedBox(height: 50),
            Text('You have pushed the button this many times:'),
            AnimatedText('$_counter', style: Theme.of(context).textTheme.headline4, useOpacity: false),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.add), onPressed: _incrementCounter, color: Colors.green),
                IconButton(icon: Icon(Icons.remove), onPressed: _decrementCounter, color: Colors.red),
              ],
            ),
            const SizedBox(height: 50),
            OutlinedButton(onPressed: _runInMainIsolate, child: Text('Run in main Isolate')),
            OutlinedButton(onPressed: _runInAnotherIsolate, child: Text('Run in separated Isolate')),
            OutlinedButton(onPressed: () => runCase(false), child: Text('Start isolator')),
            OutlinedButton(onPressed: () => runCase(true), child: Text('Start isolator with chunks')),
          ],
        ),
      ),
    );
  }
}
