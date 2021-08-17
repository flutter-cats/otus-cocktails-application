import 'package:flutter/material.dart';

class OverlayStatePageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              _showPage(context);
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: () {
              _showPage(context);
            },
            child: Text('show page'),
          ),
          TextButton(
            onPressed: () {
              _showPopup(context);
            },
            child: Text('shop popup'),
          ),
        ],
      )),
    );
  }

  void _showPage(BuildContext context) {
    final overlayState = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => _Page2(),
    );
    overlayState?.insert(entry);
  }

  void _showPopup(BuildContext context) {
    final overlayState = Overlay.of(context);
    // только для примера
    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (context) => _Popup(entry: entry!),
      opaque: false,
    );
    overlayState?.insert(entry);
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Text('Page1'),
        ),
      ),
    );
  }
}

class _Popup extends StatelessWidget {
  const _Popup({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final OverlayEntry entry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Popup',
              style: TextStyle(inherit: false),
            ),
            TextButton(
                onPressed: () {
                  entry.remove();
                },
                child: Text(
                  'Закрыть',
                  style: TextStyle(inherit: false),
                ))
          ],
        ),
      ),
    );
  }
}
