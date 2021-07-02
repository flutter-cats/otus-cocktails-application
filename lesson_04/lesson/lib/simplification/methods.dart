import 'package:flutter/material.dart';

class SampleMethodsPage1 extends StatefulWidget {
  const SampleMethodsPage1({Key? key}) : super(key: key);

  @override
  _SampleMethodsPage1State createState() => _SampleMethodsPage1State();
}

class _SampleMethodsPage1State extends State<SampleMethodsPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      //FIELD VERSION
      // body: Wrap(
      //   children: List.generate(
      //     1000,
      //     (index) => _widget1,
      //   ),
      // ),
      //METHOD VERSION
      // body: Wrap(
      //   children: List.generate(
      //     1000,
      //     (index) => _buildSquareWidget(),
      //   ),
      // ),
      //CLASS VERSION
      body: Wrap(
        children: List.generate(
          1000,
          (index) => SquareWidget(
            SecondLevelWidget('text'),
          ),
        ),
      ),
    );
  }

  Widget _buildSquareWidget() {
    // return SquareWidget(_buildSecondLevelWidget());
    return const SquareWidget(SecondLevelWidget('text'));
  }

  Widget _buildSecondLevelWidget() {
    return SecondLevelWidget('text');
  }
}

class SquareWidget extends StatelessWidget {
  const SquareWidget(
    this.child, {
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // print('build SquareWidget:${context.hashCode} '
    //     'render:${context.findRenderObject().hashCode}');
    return Container(
      color: Colors.red,
      child: child,
    );
  }
}

class SecondLevelWidget extends StatelessWidget {
  const SecondLevelWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // print('buildSecond:${context.hashCode} '
    //     'render:${context.findRenderObject().hashCode}');
    return Text(text);
  }
}
//#d143d
