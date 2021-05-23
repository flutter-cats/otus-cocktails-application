import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'initable.dart';

class StoreInitializer<T extends Initable> extends StatefulWidget {
  final Widget child;

  const StoreInitializer({Key? key, required this.child}) : super(key: key);

  @override
  _StoreInitializerState<T> createState() => _StoreInitializerState<T>();
}

class _StoreInitializerState<T extends Initable>
    extends State<StoreInitializer<T>> {
  late Future<void> _initFuture;

  @override
  void initState() {
    super.initState();

    final store = context.read<T>();
    _initFuture = store.init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }

        // TODO Показывать кнопку для повторного инита, если упала ошибка
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
