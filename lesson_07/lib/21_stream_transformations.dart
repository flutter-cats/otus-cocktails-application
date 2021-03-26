void main() {
  final iterable = Iterable.generate(10);                       //  single  sync iterable
  final stream = Stream.fromIterable(iterable); //  single async iterable

  ///
  /// Мы можем выполнять трансформации над нашими стримами, получая новые
  ///
  final itsNewStream = stream.map((element) => element * 2);
  itsNewStream.listen((element) => print(element));

  ///
  /// не обязательно создавать переменную, можно сразу создать subscription
  ///
  stream
      .map((element) => element)
      .takeWhile((element) => element < 5)
      .listen((element) {
    print('читаю только элементы < 5, $element');
  });

  ///  методы, которые выполняют модицифкацию стрима
  ///  Stream<S> map<S>(S Function(T event) convert);
  ///  Stream<T> skip(int count);
  ///  Stream<T> skipWhile(bool Function(T element) test);
  ///  Stream<T> take(int count);
  ///  Stream<T> takeWhile(bool Function(T element) test);
  ///  Stream<T> where(bool Function(T event) test);
  ///  Stream<R> cast<R>();
  ///  Stream<S> expand<S>(Iterable<S> Function(T element) convert);
}

///
/// Abstract superclass for subscriptions that forward to other subscriptions.
///
// class _ForwardingStreamSubscription<S, T>
//     extends _BufferingStreamSubscription<T> {
//   final _ForwardingStream<S, T> _stream;
//
//   StreamSubscription<S>? _subscription;
//
//   _ForwardingStreamSubscription(this._stream, void onData(T data)?,
//       Function? onError, void onDone()?, bool cancelOnError)
//       : super(onData, onError, onDone, cancelOnError) {
//     _subscription = _stream._source
//         .listen(_handleData, onError: _handleError, onDone: _handleDone);
//   }