import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/repository/models/currency.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/ui/image_page.dart';

class ItemPageArguments {
  final Item item;
  ItemPageArguments(this.item);
}

class ItemPage extends StatelessWidget with ErrorStatelessHandler {
  const ItemPage({Key? key}) : super(key: key);

  void goto(BuildContext context, Uint8List image, String tag, String title) {
    Navigator.of(context).pushNamed('/image', arguments: ImagePageArguments(title, tag, image));
  }

  //показ конкретной монеты. виджет Hero
  @override
  Widget build(BuildContext context) {
    final item = (ModalRoute.of(context)!.settings.arguments as ItemPageArguments).item;
    return Scaffold(
        appBar: AppBar(
          title: Text('№ ${item.id}, ${item.nominal}${item.currency.toSymbol()}'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(children: [
                  Flexible(
                    child: Text(
                      item.name,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  if (item.averse != null)
                    InkWell(
                        onTap: () => goto(context, item.averse!, item.id, '№ ${item.id}, ${item.nominal}${item.currency.toSymbol()}'),
                        child: Hero(tag: item.id, child: Image.memory(item.averse!, height: 180, width: 180))),
                  if (item.reverse != null)
                    InkWell(
                        onTap: () => goto(context, item.averse!, '${item.id}r', '№ ${item.id}, ${item.nominal}${item.currency.toSymbol()}'),
                        child: Hero(
                          tag: '${item.id}r',
                          child: Image.memory(item.reverse!, height: 180, width: 180),
                        )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Каталожный №', style: Theme.of(context).textTheme.bodyMedium),
                  Text(item.id, style: Theme.of(context).textTheme.bodyLarge),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Материал', style: Theme.of(context).textTheme.bodyMedium),
                  Text(item.material.toString(), style: Theme.of(context).textTheme.bodyLarge),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Вес', style: Theme.of(context).textTheme.bodyMedium),
                  Text(item.weight.toString(), style: Theme.of(context).textTheme.bodyLarge),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Чеканка', style: Theme.of(context).textTheme.bodyMedium),
                  Text(item.facilities.join(','), style: Theme.of(context).textTheme.bodyLarge),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Года', style: Theme.of(context).textTheme.bodyMedium),
                  Text(item.years.join(','), style: Theme.of(context).textTheme.bodyLarge),
                ]),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Html(data: item.description)),
              //Image.memory( )
            ],
          ),
        ));
  }
}
