import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                offset: Offset(30, 30),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
