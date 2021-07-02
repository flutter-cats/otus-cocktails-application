import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConstrainsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _example1();
  }

  Widget _example1() {
    return Container(
      color: Colors.green,
      width: 100,
      height: 100,
    );
  }

  Widget _layoutBuilder({required Widget child}) {
    return LayoutBuilder(builder: (context, constrains) {
      print('smallest:${constrains.smallest}');
      print('biggest:${constrains.biggest}');
      return child;
    });
  }

  Widget _example3() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }

  Widget _example4() {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100,
            maxWidth: 100,
          ),
          child: _layoutBuilder(
            child: Container(
              color: Colors.red,
              width: 50,
              height: 50,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100,
            maxWidth: 100,
          ),
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
