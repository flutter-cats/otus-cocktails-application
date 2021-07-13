import 'dart:async';

void main() {
  print('> Start');
  Timer.periodic(Duration(seconds: 1), (_) => print('user tap gesture'));

  final fileReader = IOFileDataReader();
  fileReader.read().listen((int data) {
    print('Current data is $data');
  });
  print('> End');
}

///
/// Мы разработчики своей библиотеки для чтения каких-либо данных.
/// Представим себе, что для чтения данных мы разработали такой интерфейс.
///
abstract class DataReader<T> {
  Stream<T> read();
}

///
/// Кажется, что такой контракт DataReader можно использовать для реализации
/// конкретных классов для чтения чело-либо. Например, создадим класс для
/// чтения из файла побайтово!
///
class IOFileDataReader implements DataReader<int> {
  @override
  Stream<int> read() {
    return Stream.periodic(Duration(seconds: 1), (int byte) => byte);
  }
}
