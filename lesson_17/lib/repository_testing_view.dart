import 'package:flutter/material.dart';
import 'package:lesson_17/entity_fabric.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:lesson_17/test_button.dart';

const String KEY = 'keyOfEntity';

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
                TestButton(title: 'Save', onPressed: () => repository.save(fabric.one)),
                TestButton(title: 'Save by Key', onPressed: () => repository.saveByKey(KEY, fabric.one)),
                TestButton(title: 'Save 10 000', onPressed: () => repository.saveMany(fabric.all)),
                TestButton(title: 'Replace 10 000', onPressed: () => repository.replaceAll(fabric.all)),
                TestButton(title: 'Read by Key', onPressed: () => repository.readByKey(KEY)),
                TestButton(title: 'Read by Id', onPressed: () => repository.readById(fabric.one.id)),
                TestButton(title: 'Read all', onPressed: () => repository.readAll()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
