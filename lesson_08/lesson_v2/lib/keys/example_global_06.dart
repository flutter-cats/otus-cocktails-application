import 'package:flutter/material.dart';
import 'package:lesson_8/keys/some_global.dart';

class ExampleGlobal06 extends StatefulWidget {
  const ExampleGlobal06({Key? key}) : super(key: key);

  @override
  _GlobalKeysSampleState createState() => _GlobalKeysSampleState();
}

class _GlobalKeysSampleState extends State<ExampleGlobal06> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _someGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO(alphamikle): - Sample Ch. 1 uncomment
      key: _scaffoldKey,
      body: SomeGlobal(
        key: _someGlobalKey,
        child: const Center(
          child: FlutterLogo(
            style: FlutterLogoStyle.stacked,
            size: 100,
          ),
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
            icon: const Icon(Icons.message),
            onPressed: () {
              // _someGlobalKey.currentState;
            },
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
    // Scaffold.of(context).showBottomSheet<void>((context) => widget);
    // _scaffoldKey.currentState?.showBottomSheet<void>((context) => widget);
    // TODO(alphamikle): - Sample Ch. 2 uncomment
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }
}
