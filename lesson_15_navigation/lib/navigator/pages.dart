import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // переопределяем автоматическое отображение кнопки назад
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Visibility(
          //visible: Navigator.of(context).canPop(),
          visible: ModalRoute.of(context)?.canPop ?? false,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: Text('Pop'),
          ),
        ),
      ),
    );
  }
}

class SamplePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title?.toString() ?? 'No title'),
      ),
    );
  }
}
