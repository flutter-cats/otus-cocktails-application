import 'package:flutter/material.dart';

class ExampleGlobal07 extends StatefulWidget {
  const ExampleGlobal07({Key? key}) : super(key: key);

  @override
  _GlobalKeysSampleState createState() => _GlobalKeysSampleState();
}

class _GlobalKeysSampleState extends State<ExampleGlobal07> {
  final _key = GlobalKey();
  final _valuekey = const ValueKey(1);

  bool value = false;

  @override
  Widget build(BuildContext context) {
    final Widget body = BigStatefulWidget(
      // TODO(alphamikle): Ch. 1 - ValueKey, Ch. 2 - GlobalKey
      key: _key,
    );

    return Scaffold(
      body: value
          ? body
          : Container(
              height: 400,
              width: 400,
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
            icon: const Icon(Icons.cut),
            onPressed: () => setState(() => value = !value),
          )
        ],
      ),
    );
  }
}

class BigStatefulWidget extends StatefulWidget {
  const BigStatefulWidget({Key? key}) : super(key: key);

  @override
  _BigStatefulWidgetState createState() => _BigStatefulWidgetState();
}

class _BigStatefulWidgetState extends State<BigStatefulWidget> {
  late List<Widget> tags;

  @override
  void initState() {
    print('initState');
    tags = List.generate(500, (index) => Chip(label: Text('$index')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('element:${context.hashCode} render:${context.findRenderObject()?.hashCode}');
    return ListView(
      scrollDirection: Axis.horizontal,
      children: tags,
    );
  }
}
