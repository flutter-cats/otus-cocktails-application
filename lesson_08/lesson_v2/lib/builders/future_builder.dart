import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FutureBuilderSample extends StatefulWidget {
  @override
  _FutureBuilderSampleState createState() => _FutureBuilderSampleState();
}

class _FutureBuilderSampleState extends State<FutureBuilderSample> {
  // final future = someService.getUsers();
  final future = Future<String?>.delayed(const Duration(seconds: 4));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilderSample'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          )
        ],
      ),
      body: FutureBuilder<String>(
        // initialData: 'I am an initial data',
        future: future.then((value) {
          // throw Exception('Casual error');
          return 'I am done, result: ${Random().nextInt(100)}';
        }),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {}

          if (snapshot.connectionState == ConnectionState.waiting) {}

          if (snapshot.connectionState == ConnectionState.active) {}

          if (snapshot.connectionState == ConnectionState.done) {}

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.hasData) {
            return Center(
                child: Text(
              snapshot.toString(),
              textAlign: TextAlign.center,
            ));
          }
          print('connectionState: ${snapshot.connectionState}');
          print('data:${snapshot.data}');
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

typedef ValueWidgetBuilder<T> = Widget Function(BuildContext context, T value);

class FutureBuilderWrapper<T> extends StatelessWidget {
  const FutureBuilderWrapper({
    required this.future,
    required this.inProgressBuilder,
    required this.noDataBuilder,
    required this.onErrorBuilder,
    required this.onDataBuilder,
    required this.initialData,
    Key? key,
  }) : super(key: key);

  final WidgetBuilder inProgressBuilder;

  final WidgetBuilder noDataBuilder;

  final ValueWidgetBuilder onErrorBuilder;

  final ValueWidgetBuilder<T> onDataBuilder;

  final Future<T> future;

  final T initialData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      initialData: initialData,
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onErrorBuilder(context, snapshot.error);
        } else if (snapshot.hasData) {
          return onDataBuilder(context, snapshot.data!);
        }
        return inProgressBuilder(context);
      },
    );
  }
}
