import 'package:flutter/material.dart';

final cardSliverDelegate = SliverChildBuilderDelegate(
  (context, index) => Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('number:$index'),
        subtitle: Text('Описание'),
      ),
    ),
  ),
  childCount: 10,
);

final cardSliverListDelegate = SliverChildListDelegate(
  List.generate(
    4,
    (index) => Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text('$index')),
      ),
    ),
  ),
);
