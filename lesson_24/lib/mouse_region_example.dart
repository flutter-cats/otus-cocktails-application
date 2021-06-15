import 'package:flutter/material.dart';

class MouseRegionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Container(
            height: 100,
            width: 300,
            child: _Hoverable(),
          ),
        ),
      ),
    );
  }
}

class _Hoverable extends StatefulWidget {
  const _Hoverable({Key? key}) : super(key: key);

  @override
  __HoverableState createState() => __HoverableState();
}

class __HoverableState extends State<_Hoverable> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.help,
      onEnter: (_) {
        setState(() => this._isHovered = true);
      },
      onExit: (_) {
        setState(() => this._isHovered = false);
      },
      child: Container(
        color: Colors.amber.withOpacity(_isHovered ? 1 : 0.5),
      ),
    );
  }
}
