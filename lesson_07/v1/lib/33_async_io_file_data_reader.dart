import 'dart:async';
import 'dart:io';

void main() async {
  print('> Start');

  await for (final element in IOFileDataReaderNotOptimized().read()) {
    ///
    /// Здесь мы читаем данные по мере необходимости их обработки
    /// OnDemand чтение данных
    ///
    print(element);

    stdin.readLineSync();
  }

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
class IOFileDataReaderNotOptimized implements DataReader<int> {
  final StreamController<int> _readController = StreamController(sync: true);

  @override
  Stream<int> read() {
    _readTheFile();
    return _readController.stream;
  }

  Future<void> _readTheFile() async {
    final fileLength = 100; //  длина файла - сколько то Gb
    for (var i = 0; i < fileLength; i++) {
      // sleep(Duration(milliseconds: 300));
      print('reading the byte on $i position');
      _readController.sink.add(i);
    }
  }

  void dispose() {
    _readController.close();
  }
}












///
/// Кажется, что такой контракт DataReader можно использовать для реализации
/// конкретных классов для чтения чело-либо. Например, создадим класс для
/// чтения из файла побайтово и с учетом lazy on demand!
///
class IOFileDataReaderOptimized implements DataReader<int> {
  @override
  Stream<int> read() async* {
    final fileLength = 100; //  длина файла - сколько то Gb
    for (var i = 0; i < fileLength; i++) {
      sleep(Duration(milliseconds: 300));
      print('yield $i');
      print('reading the byte on $i position');
      yield i;
    }
  }
}