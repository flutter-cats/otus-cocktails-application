import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialDialogsSample extends StatefulWidget {
  @override
  _MaterialDialogsSampleState createState() => _MaterialDialogsSampleState();
}

class _MaterialDialogsSampleState extends State<MaterialDialogsSample> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(
      TextButton(
        onPressed: _showAlertDialog,
        child: Text('Show AlertDialog'),
      ),
    );
    items.add(
      TextButton(
        onPressed: _showSimpleDialog,
        child: Text('Show SimpleDialog'),
      ),
    );
    items.add(
      TextButton(
        onPressed: _showCustomDialog,
        child: Text('Show CustomDialog'),
      ),
    );
    items.add(
      TextButton(
        onPressed: _showWidgetDialog,
        child: Text('Show WidgetDialog'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Dialogs'),
      ),
      body: ListView(
        children: items,
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      //barrierColor: Colors.red,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: Text('Content'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok')),
          ],
        );
      },
    );
  }

  void _showSimpleDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.blue[100]!.withOpacity(0.3),
      barrierDismissible: true,
      builder: (context) {
        return SimpleDialog(
          title: Text('SimpleDialog Title'),
          children: [
            SimpleDialogOption(
              onPressed: () {},
              child: Text('Choice 1'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: Text('Choice 2'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: Text('Choice 3'),
            )
          ],
        );
      },
      //child: Не использовать!
    );
  }

  // Пример с анимацией
  void _showCustomDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          // Dialog реализуе внутри себя анимацию при изменении viewInsets
          return Dialog(
            insetAnimationDuration: Duration(seconds: 1),
            // Анимация при изменении положения диалога
            //insetAnimationCurve: Curves.bounceIn,
            insetPadding: const EdgeInsets.all(100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Dialog'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'TextField'
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // Пример кастомной анимации при открытии клавиатуры без использования Dialog
  void _showWidgetDialog() {
    final insetPadding = const EdgeInsets.all(16);
    Widget content = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Title'),
            Text('Body'),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: content,
          );
          // final EdgeInsets effectivePadding =
          //     MediaQuery.of(context).viewInsets + insetPadding;
          // return AnimatedPadding(
          //   padding: effectivePadding,
          //   duration: Duration(seconds: 1),
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: content,
          //   ),
          // );
        });
  }
}
