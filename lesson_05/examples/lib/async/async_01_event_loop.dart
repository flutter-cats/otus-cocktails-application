import 'package:flutter/material.dart';
import 'package:lesson05async/async/async_07_on_preset_handler.dart';
import 'package:lesson05async/async/async_10_future_builder.dart';
import 'package:lesson05async/async/async_15_event_loop_and_future.dart';

void main() {

  ///
  ///  problem
  ///
  // runApp(ShowTheProblemDemo());

  ///
  /// lets try futures
  /// async_03_future_ctors
  /// async_04_future_resolving
  /// async_05_completer
  ///

  ///
  /// even loop and queue
  ///
  // runApp(ShowTheSequenceOfFutures());

  ///
  /// future builder
  ///
  // runApp(FutureBuilderDemo());

  ///
  /// async_11_future_try_catch
  /// async_12_await_async
  ///

  runApp(IsProblemResolvedDemo());
}

class DemoWidget01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowTheProblemDemo!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Весь ваш код выполняется в одном потоке',
                textAlign: TextAlign.center),
            Image.asset('assets/gifs/so_fast_cats.gif'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _iterateCollection,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _iterateCollection() {
    var i = 0;
    final soBigCollection = Iterable.generate(1e10.toInt());
    for (; i < soBigCollection.length; i++) {}
    print(i);
  }
}

class ShowTheProblemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowTheProblemDemo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 25, color: Colors.blue),
          )),
      home: DemoWidget01(),
    );
  }
}
