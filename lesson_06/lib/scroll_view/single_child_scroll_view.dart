import 'package:flutter/material.dart';

class SingleChildScrollViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: _buildWithSingleChildScrollView(),
    );
  }

  Widget _buildWithoutScrollWidget() {
    return _VerticalPage();
  }

  Widget _buildWithSingleChildScrollView() {
    return SingleChildScrollView(child: _VerticalPage());
  }

  Widget _buildWrongConstrains() {
    final appBar = Container(
      color: Colors.red,
      height: 56,
    );
    return Column(
      children: [
        appBar,
        _buildWithSingleChildScrollView(),
      ],
    );
  }

  // axis direction
  Widget _buildHorizontalSingleChildScrollView() {
    final direction = Axis.horizontal;
    final reverse = false;
    final textDirection = TextDirection.ltr;
    final child = _HorizontalPage();
    //final child = _VerticalPage();
    return Directionality(
      textDirection: textDirection,
      child: SingleChildScrollView(
        scrollDirection: direction,
        reverse: reverse,
        child: child,
      ),
    );
  }
}

class _VerticalPage extends StatelessWidget {
  static const _itemsCount = 100;

  @override
  Widget build(BuildContext context) {
    final header = Image.network(
      'https://hsto.org/getpro/habr/post_images/ff2/075/6a5/ff20756a5a3596cf7cf7d91eb4081b75.jpg',
      // height: 1000,
      // fit: BoxFit.fill,
    );

    final body = Column(children: [
      Text('Title', style: Theme.of(context).textTheme.headline6),
      ...List.generate(_itemsCount,
          (index) => _buildPropertyTile('Key$index', 'Value$index'))
    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header,
        body,
        _buildFooter(context),
      ],
    );
  }

  Widget _buildPropertyTile(String key, String value) {
    return ListTile(
      title: Text(key),
      trailing: Text(value),
    );
  }

  Widget _buildFooter(BuildContext context) {
    print('build _buildFooter');
    return Container(
      height: 100,
      color: Theme.of(context).primaryColor,
      child: Text('Footer'),
    );
  }
}

class _HorizontalPage extends StatelessWidget {
  static const _itemsCount = 255;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...List.generate(
            _itemsCount,
            (index) => Container(
                  width: 56,
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 0.5),
                  color: _generateColor(index),
                  child: Center(
                      child: Text(
                    '$index',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: _generateTextColor(index)),
                  )),
                ))
      ],
    );
  }

  Color _generateColor(int index) {
    return Color.fromARGB(index, 32, 16, 56);
  }

  Color _generateTextColor(int index) {
    return Color.fromARGB(255, index, index, index);
  }
}
