import 'package:flutter/material.dart';

class GlobalKeysV3Sample extends StatefulWidget {
  @override
  _GlobalKeysSampleState createState() => _GlobalKeysSampleState();
}

class _GlobalKeysSampleState extends State<GlobalKeysV3Sample> {
  final _key = GlobalKey();
  final _valuekey = ValueKey(1);

  bool value = false;

  @override
  Widget build(BuildContext context) {
    Widget body = BigStatefulWidget(
        // key: _valuekey, // TODO Ch. 1 - ValueKey, Ch. 2 - GlobalKey
        );

    return Scaffold(
      body: value
          ? body
          : Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
              ),
              child: body,
            ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.cut),
            onPressed: () => setState(() => value = !value),
          )
        ],
      ),
    );
  }
}

class BigStatefulWidget extends StatefulWidget {
  BigStatefulWidget({Key key}) : super(key: key);

  @override
  _BigStatefulWidgetState createState() => _BigStatefulWidgetState();
}

class _BigStatefulWidgetState extends State<BigStatefulWidget> {
  List<Widget> tags;

  @override
  void initState() {
    print('initState');
    tags = List.generate(500, (index) => Chip(label: Text('$index')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'element:${context.hashCode} render:${context.findRenderObject()?.hashCode}');
    return ListView(
      children: tags,
      scrollDirection: Axis.horizontal,
    );
  }
}
