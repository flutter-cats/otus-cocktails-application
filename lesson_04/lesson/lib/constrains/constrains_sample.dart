import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConstrainsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _example1();
  }

  Widget _example1() {
    return Container(color: Colors.red);
  }

  Widget _example2() {
    return LayoutBuilder(builder: (context, constrains) {
      print('smallest:${constrains.smallest}');
      print('biggest:${constrains.biggest}');
      return _example1();
    });
  }

  Widget _example3() {
    return Center(
      child: Container(color: Colors.red),
    );
  }

  Widget _example4() {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
          child: Container(
            color: Colors.red,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
