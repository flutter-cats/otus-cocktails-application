import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/entity_fabric.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:lesson_17/test_button.dart';

const String KEY = 'keyOfEntity';
const String SAVE = 'Save';
const String SAVE_BY_KEY = 'Save by Key';
const String SAVE_10_000 = 'Save 10 000';
const String REPLACE_10_000 = 'Replace 10 000';
const String READ_BY_KEY = 'Read by Key';
const String READ_BY_ID = 'Read by Id';
const String READ_ALL = 'Read all';

class RepositoryTestingView<T extends Entity> extends StatefulWidget {
  const RepositoryTestingView({
    required this.repository,
    Key? key,
  }) : super(key: key);

  final EntityRepository<T> repository;

  @override
  _RepositoryTestingViewState<T> createState() {
    return _RepositoryTestingViewState<T>();
  }
}

class _RepositoryTestingViewState<T extends Entity> extends State<RepositoryTestingView> {
  EntityRepository<Entity> get repository => widget.repository;
  EntityFabric get fabric => EntityFabric();

  AsyncCallback runner(AsyncCallback operation, String code) {
    return () async {
      bench.start('Operation "$code" of "${repository.runtimeType}" take');
      try {
        await operation();
      } catch (error) {
        print('Error on operation "$code" -> $error');
      }
      final double micros = bench.end('Operation "$code" of "${repository.runtimeType}" take');
      ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.timeout);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$code -> ${micros}ms')));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircularProgressIndicator(),
                CircularProgressIndicator(),
                CircularProgressIndicator(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TestButton(title: SAVE, onPressed: runner(() => repository.save(fabric.one), SAVE)),
                TestButton(title: SAVE_BY_KEY, onPressed: runner(() => repository.saveByKey(KEY, fabric.one), SAVE_BY_KEY)),
                TestButton(title: SAVE_10_000, onPressed: runner(() => repository.saveMany(fabric.all), SAVE_10_000)),
                TestButton(title: REPLACE_10_000, onPressed: runner(() => repository.replaceAll(fabric.all), REPLACE_10_000)),
                TestButton(title: READ_BY_KEY, onPressed: runner(() => repository.readByKey(KEY), READ_BY_KEY)),
                TestButton(title: READ_BY_ID, onPressed: runner(() => repository.readById(fabric.one.id), READ_BY_ID)),
                TestButton(title: READ_ALL, onPressed: runner(() => repository.readAll(), READ_ALL)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
