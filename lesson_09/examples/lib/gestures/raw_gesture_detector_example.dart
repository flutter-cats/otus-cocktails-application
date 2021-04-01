import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RawGestureDetectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RawGestureDetector"),
      ),
      body: _Example(),
    );
  }
}

class _Example extends StatefulWidget {
  @override
  __ExampleState createState() => __ExampleState();
}

class __ExampleState extends State<_Example> {
  var _last;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          CustomLongPressRecognizer:
              GestureRecognizerFactoryWithHandlers<CustomLongPressRecognizer>(
            () => CustomLongPressRecognizer(),
            (CustomLongPressRecognizer instance) {
              instance
                ..onLongPress = () {
                  setState(() {
                    _last = 'Very long press';
                  });
                };
            },
          ),
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Text(
            _last ?? '',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}

class CustomLongPressRecognizer extends LongPressGestureRecognizer {
  CustomLongPressRecognizer()
      : super(
          duration: const Duration(seconds: 1),
        );
}
