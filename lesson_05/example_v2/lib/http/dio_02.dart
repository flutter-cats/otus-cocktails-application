import 'dart:io';

import 'package:dio/dio.dart';

Future<void> main() async {
  final client = Dio(BaseOptions(baseUrl: 'https://the-cocktail-db.p.rapidapi.com'));
  try {
    const url = '/popular.php';

    try {
      final response = await client.get(
        url,
        options: Options(
          headers: {
            'x-rapidapi-key': 'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b_',
          },
        ),
      );
    } catch (error) {
      // TO DO
      print('GET ERROR');
    }
  } on DioError catch (error) {
    print('DIO ERROR');
    rethrow;
  } on SocketException catch (error) {
    print('Похоже, что какие-то проблемы с connection!');
  } catch (error) {
    print('Чтото пошло не так! $error');
  } finally {
    client.close();
  }
}
