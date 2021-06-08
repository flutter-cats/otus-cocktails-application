import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numberpicker/numberpicker.dart';

import 'stores/trial_calculator_store.dart';

class TrialCalculatorPage extends StatefulWidget {
  @override
  _TrialCalculatorPageState createState() => _TrialCalculatorPageState();
}

class _TrialCalculatorPageState extends State<TrialCalculatorPage> {
  final store = TrialCalculatorStore(
    onResultUpdated: (value) {
      if (value == 200) {
        Fluttertoast.showToast(
          msg: "Достигнут максимум. Пожалуйста, перейдите на полную версию.",
          toastLength: Toast.LENGTH_LONG,
        );
      }
    },
  );

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

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
