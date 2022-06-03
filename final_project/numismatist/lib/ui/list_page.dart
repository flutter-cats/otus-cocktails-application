import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/ui/item_page.dart';

class ListPageArguments {
  final int list;
  final String searchBy;
  ListPageArguments(
    this.list,
    this.searchBy,
  );
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with ErrorStatefullHandler {
  void goto(BuildContext context, int id) {
    Navigator.of(context).pushNamed('/item', arguments: ItemPageArguments(id));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ListPageArguments? ?? ListPageArguments(0, '');
    return Scaffold(appBar: AppBar(title: Text(args.list == 0 ? 'Поиск по "${args.searchBy}"' : 'Каталог ${args.list}'), centerTitle: true), body: SafeArea(child: CustomScrollView(slivers: [])));
  }
}
