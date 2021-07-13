import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

void main() {
  final Stream<List<int>> fileStream = File(join(Directory.current.path, 'assets', 'texts', 'fish.txt')).openRead();
  // fileStream.listen((event) {
  //   print('Data: $event');
  // });
  fileStream.transform(utf8.decoder).transform(LineSplitter()).listen((String line) {
    print('File line: $line');
  });
}
