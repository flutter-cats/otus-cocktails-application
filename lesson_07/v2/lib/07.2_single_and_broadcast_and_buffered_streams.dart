import 'dart:async';

void main() async {
  const elementData = 10;
  const nextElementData = 11;

  ///
  /// The controller buffers all incoming events until a subscriber is
  /// registered, but this feature should only be used in rare circumstances.
  ///
  // final streamController = StreamController<int>();

  ///
  /// Broadcast streams do not buffer events when there is no listener.
  ///
  final streamController = StreamController<int>.broadcast();

  ///
  /// добавим элементы в наш поток
  ///
  streamController.sink.add(elementData);
  streamController.sink.add(nextElementData);

  final subscription = streamController.stream.listen((element) => print('element data is $element'));

  ///
  /// Так как пример синхронный, то в случае синхронного закрытия и потока и подписки
  /// наша подписка не будет иметь смысла
  /// Поэтому мы закроем нашу подписку и сам поток в следующем фрейме нашего event loop
  ///
  Future(() {
    subscription.cancel();
    streamController.close();
  });
}
