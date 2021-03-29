import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(24),
          scrollDirection: Axis.horizontal,
          // mainAxisSize: MainAxisSize.min,
          children: [
            _ButtonsList(
              enabled: false,
            ),
            const SizedBox(width: 48),
            _ButtonsList(
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonsList extends StatelessWidget {
  final bool enabled;

  const _ButtonsList({
    Key? key,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VoidCallback? action = enabled ? () {} : null;

    return Column(
      children: [
        const SizedBox(height: 24),
        RawMaterialButton(
          onPressed: action,
          child: Text("RawMaterialButton"),
        ),
        const SizedBox(height: 24),
        TextButton(
          child: Text("TextButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          child: Text("OutlinedButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        IconButton(
          icon: Icon(Icons.play_arrow),
          tooltip: "Like",
          onPressed: action,
        ),
        const SizedBox(height: 24),
        CupertinoButton(
          child: Text("CupertinoButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        CupertinoButton.filled(
          child: Text("CupertinoButton.filled"),
          onPressed: action,
        ),
      ],
    );
  }
}
