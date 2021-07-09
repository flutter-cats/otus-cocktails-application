import 'package:flutter/material.dart';
import 'package:lesson_05/builder_delegates.dart';

class GridViewSamplePage extends StatelessWidget {
  final items = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: _buildGridViewFromBuilder(),
    );
  }

// Создает GridView стараясь создать элемент с размером maxCrossAxisExtent по основной оси
  Widget _buildExtentGridView() {
    // соотнощение ширины к высоте
    final childAspectRatio = 2.0;
    // размер по основной оси
    final maxCrossAxisExtent = 100.0;
    return GridView.extent(
      scrollDirection: Axis.vertical,
      childAspectRatio: childAspectRatio,
      maxCrossAxisExtent: maxCrossAxisExtent,
      children: items.map((item) => _GridItem(item)).toList(growable: false),
    );
  }

  // Создает GridView размещая crossAxisCount элементов по основной оси
  Widget _buildCountGridView() {
    final crossAxisCount = 4;
    return GridView.count(
      childAspectRatio: 1,
      crossAxisCount: crossAxisCount,
      children: items.map((item) => _GridItem(item)).toList(growable: false),
    );
  }

  Widget _buildGridViewFromBuilder() {
    return GridView.builder(
      // itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => _GridItem(index),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1.0,
      ),
    );
  }

  Widget _buildGridView() {
    return GridView(
        children: items.map((item) => _GridItem(item)).toList(growable: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          childAspectRatio: 1.0,
        ));
  }

  Widget _buildCustomGridView() {
    return GridView.custom(
      scrollDirection: Axis.horizontal,
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _GridItem(index),
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
    );
  }

  Widget _buildCustomGridView2() {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 4.0,
    );
    return GridView.custom(
      childrenDelegate: cardSliverDelegate,
      gridDelegate: gridDelegate,
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('$index')),
    ));
  }
}
