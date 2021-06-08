import 'package:flutter/material.dart';

class StfulAppExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Stful Example');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;

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
            Text(
              'Current count is:',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text('Decrement'),
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: _decrementCounter,
                  ),
                  TextButton(
                    child: Text('Increment'),
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: _incrementCounter,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() => setState(() => _counter++);

  void _decrementCounter() => setState(() => _counter--);
}
