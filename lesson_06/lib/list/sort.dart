import 'package:flutter/material.dart';

class SortListView extends StatefulWidget {
  const SortListView({Key? key}) : super(key: key);

  @override
  _SortListViewState createState() => _SortListViewState();
}

class _SortListViewState extends State<SortListView> {
  List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: sort,
        child: Icon(Icons.refresh),
      ),
      body: _buildKeyedListView(),
    );
  }

  Widget _buildKeyedListView() {
    return ListView(
      children: [
        ...items.map(
          (e) => _ListItem(
            e,
            key: ValueKey(e),
          ),
        )
      ],
    );
  }

  Widget _buildKeyedListViewBuilder() {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemBuilder: (_, i) {
        final item = items.elementAt(i);
        return _ListItem(
          item,
          key: ValueKey(item),
        );
      },
      itemCount: items.length,
    );
  }

  Widget _buildCustomListView() {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (_, i) => _ListItem(
          items.elementAt(i),
          key: ValueKey(items.elementAt(i)),
        ),
        childCount: items.length,
        findChildIndexCallback: (key) {
          final valueKey = key as ValueKey<int>;
          final value = valueKey.value;
          return items.indexOf(value);
        },
      ),
    );
  }

  void sort() {
    setState(() {
      items = items.reversed.toList();
    });
  }
}

class _ListItem extends StatefulWidget {
  const _ListItem(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem>
    with AutomaticKeepAliveClientMixin {
  bool _isChecked = false;

  @override
  void initState() {
    print('init item ${widget.index}');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose item ${widget.index}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('buildItem ${widget.index}');
    // обязателен если переопределяется
    // AutomaticKeepAliveClientMixin!!!
    super.build(context);
    return Card(
      child: ListTile(
        onTap: () {},
        title: Text('${widget.index}'),
        trailing: Checkbox(
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
          value: _isChecked,
        ),
      ),
    );
  }

  //TODO: Как можно оптимизировать?
  @override
  bool get wantKeepAlive => true;
}
