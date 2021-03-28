///
/// Create Future with computation
///
// void main() {
//  final future = Future(() {
//    print('Hello From Async operation');
//  });
//
//  print('Main method is complete!');
// }

///
/// Create value ready or error future
///
// void main() {
//  final future = Future.error(ArgumentError('There are no required data!'));
//  // final future = Future.value(20);
//
//  print('Main method is complete!');
// }

///
/// Create Delayed Future
///
// void main() {
//  final future = Future.delayed(Duration(seconds: 3),  () {
//    print('Hello From Delayed Async operation');
//  });
//
//  print('Main method is complete!');
// }

///
/// Create Sync Future
///
// void main() {
//  final future = Future<int>.sync(() {
//    print('Hello From Delayed Async operation');
//    return 10;
//  });
//
//  print('Main method is complete!');
// }
//
//void main() {
//  final future = Future.sync(() {
//    Future(() {
//      print('Hello From Delayed Async operation');
//    });
//  });
//
//  print('Main method is complete!');
//}

///
/// future.sync scenario

// void main() {
//   final cache = <int>[10];
//
//   final future = Future<int>.sync(() {
//     if (cache.isEmpty) {
//       return Future<int>(() {
//         print('Cache is empty, calculating the result');
//         cache.add(10);
//         return cache.first;
//       });
//     } else {
//       print('Cache is not empty, returning the result ${cache.first}');
//       return cache.first;
//     }
//   });
//
//   print('Main method is complete!');
// }

///
/// sync & value
///
void main() {
  Future.sync(() {
    print('Hello From Delayed Async operation');
  });

  Future.value(
    (() {
      print('Hello From Future.Value');
    }).call(),
  );

  print('Main method is complete!');
}
