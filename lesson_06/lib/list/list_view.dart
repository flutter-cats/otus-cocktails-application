import 'package:flutter/material.dart';
import 'package:lesson_05/builder_delegates.dart';

class ListViewSamplePage extends StatefulWidget {
  @override
  _ListViewSamplePageState createState() => _ListViewSamplePageState();
}

class _ListViewSamplePageState extends State<ListViewSamplePage> {
  final items = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: _listViewSeparatedBuilder(context));
  }

  // AutomaticKeepAliveClientMixin
  Widget _buildListView(BuildContext context) {
    return ListView(
      //addAutomaticKeepAlives: true,
      children: items.map((index) => _ListItem(index)).toList(),
    );
  }

  // ShrinkWrap
  Widget _listViewBuilder(BuildContext context) {
    final shrinkWrap = false;
    return Container(
      color: Colors.grey,
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          shrinkWrap: shrinkWrap,
          itemCount: items.length,
          itemBuilder: _buildItem),
    );
  }

  Widget _listViewSeparatedBuilder(BuildContext context) {
    return ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => Container(
            color: Colors.green,
            padding: const EdgeInsets.all(8),
            child: Text('separator - $index')),
        itemBuilder: _buildItem);
  }

  Widget _buildCustomListView1(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _buildItem(context, index),
        childCount: items.length,
      ),
    );
  }

  Widget _buildCustomListView2(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildListDelegate(
        items.map((item) => _buildItem(context, item)).toList(growable: false),
      ),
    );
  }

  Widget _buildCustomListView3(BuildContext context) {
    return ListView.custom(
      childrenDelegate: cardSliverDelegate,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return _ListItem(index);
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
