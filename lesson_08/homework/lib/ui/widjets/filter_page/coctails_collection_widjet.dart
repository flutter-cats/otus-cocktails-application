import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:cocktail/ui/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoctailCollectionWidjet extends StatelessWidget {
  Widget _buildCustomGridView() {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 1.0,
    );

    final sliverDelegate = SliverChildBuilderDelegate(
        (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('number:$index'),
                  subtitle: Text('Описание'),
                ),
              ),
            ),
        childCount: 10);

    return GridView.custom(
      childrenDelegate: sliverDelegate,
      gridDelegate: gridDelegate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCustomGridView();
  }
}
