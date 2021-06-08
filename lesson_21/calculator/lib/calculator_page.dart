import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

import 'stores/calculator_store.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final store = CalculatorStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (context) {
                    return NumberPicker(
                      value: store.firstNumber.value,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (newValue) {
                        store.setFirstNumber(newValue);
                      },
                    );
                  },
                ),
                Icon(Icons.add),
                Observer(
                  builder: (context) {
                    return NumberPicker(
                      value: store.secondNumber.value,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (newValue) {
                        store.setSecondNumber(newValue);
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (context) {
                return Text(
                  "Result: ${store.result}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
