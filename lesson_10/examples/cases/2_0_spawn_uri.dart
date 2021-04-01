import 'dart:isolate';

import 'package:examples/service/utils.dart';

const String remoteDartCodeUrl = 'https://gist.githubusercontent.com/alphamikle/2676a209c60df5d22e9849859956b6fd/raw/d66d05bacd272212488bbdea89d59fdd938a162a/isolate.dart';
const String localDartCodeUrl = './2_1_spawn_uri_companion.dart';

void main() {
  runIsolate();
}

Future<void> runIsolate() async {
  final Isolate remoteIsolate = await Isolate.spawnUri(Uri.parse(remoteDartCodeUrl), ['Arg 1 For remote', 'Arg 2 For remote'], {'field 1': 1, 'field 2': 2});
  final Isolate localIsolate = await Isolate.spawnUri(Uri.parse(localDartCodeUrl), ['Arg 1 For local', 'Arg 2 For local'], {'field 1': 1, 'field 2': 2});
  await wait(10000);
}
