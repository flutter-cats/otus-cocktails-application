import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart';

Future<void> main() async {
  final client = Client();
  try {
    const url = 'https://the-cocktail-db.p.rapidapi.com/popular.php';

    // Future<String> response = http.get(url, ...);
    // Future<String> response = http.put(url, ...);
    // Future<String> response = http.post(url, ...);
    // Future<String> response = http.delete(url, ...);
    // Future<String> response = http.patch(url, ...);
    // Future<String> response = http.read(url, ...);

    final Response response = await client.get(Uri.parse(url), headers: {
      'x-rapidapi-key': 'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b',
    });

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final drinksCollection = jsonResponse['drinks'] as Iterable<dynamic>;
      print(drinksCollection); // <- Ответ
      assert(drinksCollection.isNotEmpty);
    } else {
      print(response.body);
      throw HttpException('Request failed with status: ${response.statusCode}');
    }
  } on ClientException catch (error) {
    throw HttpException('Request failed with status: $error');
  } on SocketException catch (_) {
    print('Похоже, что какие-то проблемы с connection!');
  } catch (_) {
    print('Чтото пошло не так!');
  } finally {
    client.close();
  }
}
