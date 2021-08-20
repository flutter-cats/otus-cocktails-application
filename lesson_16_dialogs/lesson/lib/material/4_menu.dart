import 'package:flutter/material.dart';

class ScaffoldPopups extends StatefulWidget {
  @override
  _ScaffoldPopupsState createState() => _ScaffoldPopupsState();
}

class _ScaffoldPopupsState extends State<ScaffoldPopups> {
  final _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        title: GestureDetector(
            onTap: () {
              _showMenu(context);
            },
            child: Text('Scaffold Popups')),
      ),
      body: Builder(
        builder: (context) {
          return _buildBody(context);
        },
      ),
    );
  }

  // Пример с использованием PopupMenuButton
  Widget _buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text('Item $i'),
          trailing: PopupMenuButton(
            child: Icon(Icons.more_vert),
            onSelected: (value) {
              print('onSelected:${value}');
              //action
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    value: 'variant1',
                    child: ListTile(
                      title: Text('Variant 1'),
                    )),
                PopupMenuItem(
                    value: 'variant2',
                    child: ListTile(
                      title: Text('Variant 2'),
                    )),
                CheckedPopupMenuItem(
                  value: 'variant3',
                  checked: true,
                  child: Text('Variant 3'),
                )
              ];
            },
          ),
        );
      },
    );
  }

  // Пример кастомного отображения
  void _showMenu(BuildContext context) {
    final renderBox =
        _appBarKey.currentState!.context.findRenderObject() as RenderBox;
    final globalPosition = renderBox.localToGlobal(Offset.zero);
    showMenu(
        context: context,
        position:
            RelativeRect.fromLTRB(globalPosition.dx, globalPosition.dy, 0, 0),
        items: [
          PopupMenuItem(
              value: 'variant2',
              child: ListTile(
                title: Text('Variant 2'),
              )),
        ]);
  }
}
