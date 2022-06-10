import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/state/catalogs_state.dart';
import 'package:numismatist/state/items_state.dart';
import 'package:numismatist/state/items_state.dart';
import 'package:numismatist/ui/component/coin_list_item.dart';
import 'package:numismatist/ui/item_page.dart';
import 'package:provider/provider.dart';

class ListPageArguments {
  final String catalogId;
  final String searchBy;
  ListPageArguments({
    required this.catalogId,
    this.searchBy = '',
  });
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with ErrorStatefullHandler {
  void goto(BuildContext context, Item item) {
    Navigator.of(context).pushNamed('/item', arguments: ItemPageArguments(item));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ListPageArguments? ?? ListPageArguments(catalogId: '');
    final itemsState = Provider.of<ItemsState>(context);
    if (args.catalogId.isNotEmpty) {
      itemsState.getItems(args.catalogId);
    } else {
      itemsState.findItems(args.searchBy);
    }
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(args.catalogId.isEmpty ? 'Поиск по "${args.searchBy}"' : args.searchBy),
          centerTitle: true,
          floating: true,
        ),
        Observer(
            builder: (context) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => CoinListItem(
                            itemsState.items[index],
                            onTap: () => goto(context, itemsState.items[index]),
                          ),
                      childCount: itemsState.items.length),
                ))
      ])),
    );
  }
}
