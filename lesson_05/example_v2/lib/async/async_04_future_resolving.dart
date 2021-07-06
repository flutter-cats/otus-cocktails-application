int ourComputation() {
  const canComplete = true;
  if (canComplete) {
    return 7;
  }
  throw Exception('Что-то случилось (');
}

void main() {
  Future<int>.delayed(const Duration(seconds: 3), ourComputation).then((value) {
    print('current result is $value!');
  }).catchError((error) {
    print(error);
  }).whenComplete(() {
    print('Операция завершена - независимо от того, с ошибкой или нет');
  });
  print('Main method is complete!');
}
