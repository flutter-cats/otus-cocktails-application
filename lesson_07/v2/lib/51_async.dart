import 'dart:async';

import 'package:async/async.dart';

Future<void> main() async {
  print('> Start');

  final stream1 = Stream.fromIterable(Iterable.generate(10, (i) => i));
  final stream2 = Stream.fromIterable(Iterable.generate(10, (i) => i + 10));


  ///
  /// merge
  ///
  final mergedStream = StreamGroup.merge([stream1, stream2]);
  await for(final element in mergedStream) {
    print(element);
  }


  ///
  /// zip
  ///
  final stream3 = Stream.fromIterable(Iterable.generate(10, (i) => i));
  final stream4 = Stream.fromIterable(Iterable.generate(10, (i) => i + 10));
  final stream5 = Stream.fromIterable(Iterable.generate(10, (i) => i + 20));

  final zipStream = StreamZip([stream3, stream4, stream5]);
  await for(final element in zipStream) {
    print(element);
  }
  print('> End');
}
