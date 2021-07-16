import 'package:flutter/material.dart';

class ValueListenableSample extends StatefulWidget {
  const ValueListenableSample({Key? key}) : super(key: key);

  @override
  State<ValueListenableSample> createState() => _ValueListenableSampleState();
}

class _ValueListenableSampleState extends State<ValueListenableSample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ValueListenableSample')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Radius'),
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext context, int value, Widget? child) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('$value'),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(value.toDouble())),
                    child: child,
                  ),
                ],
              ),
              child: Image.network('https://bipbap.ru/wp-content/uploads/2019/07/59b21ebebd0470cb6d8b4570.jpg'),
            )
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _counter,
        builder: (BuildContext context, int value, Widget? child) => FloatingActionButton(
          onPressed: () => _counter.value += 1,
          child: Text('$value'),
        ),
      ),
    );
  }
}
