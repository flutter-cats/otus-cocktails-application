import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderSample extends StatefulWidget {
  const StreamBuilderSample({Key? key}) : super(key: key);

  @override
  _StreamBuilderSampleState createState() => _StreamBuilderSampleState();
}

class _StreamBuilderSampleState extends State<StreamBuilderSample> {
  final stream = Stream<String>.periodic(const Duration(seconds: 1), (count) {
    if (count == 0) {
      return 'Zero';
    }

    if (count % 5 == 0 && count % 3 == 0) {
      throw Exception('fizzbuzz');
    } else if (count % 3 == 0) {
      return 'fizz $count';
    } else if (count % 5 == 0) {
      return 'buzz $count';
    }
    return '$count';
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilderSample'),
      ),
      body: StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data!),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
