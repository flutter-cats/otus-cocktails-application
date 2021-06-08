import 'package:flutter/material.dart';
import 'package:lesson_18/di/di.dart';
import 'package:lesson_18/provider/injectable_deps.dart';
import 'package:lesson_18/provider/registrations.dart';
import 'package:lesson_18/views/change_notifier_view.dart';
import 'package:lesson_18/views/future_view.dart';
import 'package:lesson_18/views/simple_view.dart';
import 'package:lesson_18/views/stream_view.dart';

void main() {
  registerDependencies();
  configureDependencies();

  final IFirstClass iFirstClass = di.get();
  print(iFirstClass.isRegistered);
  runApp(
    Registrations(
      di: di,
      app: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App State',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'App State'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> types = ['Simple', 'Future', 'Stream', 'Change Notifier'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: types.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(types[index]),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Simple'),
              Tab(text: 'Future'),
              Tab(text: 'Stream'),
              Tab(text: 'Change Notifier'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SimpleView(),
            FutureView(),
            StreamView(),
            ChangeNotifierView(),
          ],
        ),
      ),
    );
  }
}
