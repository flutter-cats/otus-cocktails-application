///
/// Поговорим про Iterable<int>
/// Iterator<E>
///   bool moveNext();
///   E get current
///
///
void main() {
  print('> Start');

  ///
  /// Обычный сценарий обхода коллекции - используем
  /// for in
  ///
  final collection = [1, 2, 3, 4, 5];
  for (final i in collection) {
    print('collection item is $i');
  }
  //
  //  ///
  //  /// Но этот сценарий ForIn, ForEach подразумевает использование
  //  /// итератора
  //  ///
  //  /// Как бы мы могли обойти коллекицю, используя ее итератор
  //  ///
  ///
  /// demo:
  ///
  // final collectionIterator = collection.iterator;
  // collectionIterator.moveNext();
  // print(collectionIterator.current);
  // collectionIterator.moveNext();
  // print(collectionIterator.current);
  //
  // while (collectionIterator.moveNext()) {
  //   print(collectionIterator.current);
  // }

  ///
  /// Можно ли сделать такой итератор, чтобы в какой-то момент времени
  /// можно было прекратить обход по коллекции?
  /// И чтобы значение получалось пот ребованию? (допустим, генерация таких
  /// значений очень дорогая по времени)

  // for (final element in getTopNCollection(10, 5)) {
  //   print(element);
  // }

  print('> End');
}

///
/// 1.  Попробуем реализовать свой Iterable<T>
///
//Iterable<int> getTopNCollection(int start, int count) {
//  for (var i = start; i < start + 10; i++) {}
//}

///
///2.  Попробуем реализовать свой Iterable<T> sync*
///
//Iterable<int> getTopNCollection(int start, int count) sync* {
//  for (var i = start; i <= (start + count); i++) {
//    print('yield $i');
//    yield i;
//  }
//}

///
///3.  Попробуем реализовать свой Iterable<T> sync*
///    Сразу выкидываем набор элементов
///
//Iterable<int> getTopNCollection(int start, int count) sync* {
//  final result = <int>[];
//  for (var i = start; i <= (start + count); i++) {
//    result.add(i);
//  }
//
//  yield* result;
//}

///
///4.  Попробуем реализовать свой рекурсивный Iterable<T> sync*
///    будет примерно такой набор вызовов
///     10, 5
///     11, 4
///     12, 3
///     13, 2
///     14, 1
///     15, 0
///
// Iterable<int> getTopNCollection(int start, int count) sync* {
//   print('newStart is $start, newcCunt is $count');
//   if (start <= (start + count)) {
//     yield start;
//     yield* getTopNCollection(++start, count - 1);
//   }
// }
