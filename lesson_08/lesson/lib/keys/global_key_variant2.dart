import 'package:flutter/material.dart';

class GlobalKeysV2Sample extends StatefulWidget {
  @override
  _GlobalKeysSampleState createState() => _GlobalKeysSampleState();
}

class _GlobalKeysSampleState extends State<GlobalKeysV2Sample> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey, // TODO: - Sample Ch. 1 uncomment
      body: Center(
        child: FlutterLogo(
          style: FlutterLogoStyle.stacked,
          size: 100,
        ),
      ),
      // body: Builder(
      //   builder: (context) => Center(
      //     child: GestureDetector(
      //       onTap: () => _showBottomSheet(context, 'Hello there!'),
      //       child: FlutterLogo(
      //         style: FlutterLogoStyle.stacked,
      //         size: 100,
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () => _showBottomSheet(context, 'Hello there!'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String title) {
    final widget = Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue,
      child: Text(title),
    );
    Scaffold.of(context).showBottomSheet((context) => widget);
    _scaffoldKey.currentState
        .showBottomSheet((context) => widget); // TODO: - Sample Ch. 1 uncomment
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }
}
