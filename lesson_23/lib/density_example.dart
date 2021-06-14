import 'package:flutter/material.dart';

class DensityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(),
        ),
        const SizedBox(width: 64),
        Expanded(
          child: Theme(
            data: ThemeData(visualDensity: VisualDensity.compact),
            child: TextField(),
          ),
        ),
      ],
    );
  }
}
