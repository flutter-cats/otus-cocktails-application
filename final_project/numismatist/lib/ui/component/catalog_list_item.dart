import 'package:flutter/material.dart';
import 'package:numismatist/repository/models/catalog.dart';

class CatalogListItem extends StatelessWidget {
  final Catalog catalog;
  final GestureTapCallback? onTap;

  const CatalogListItem(this.catalog, {this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Flexible(
                    child: Text(
                      catalog.name,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Монет в каталоге: ${catalog.items.length}',
                    style: Theme.of(context).textTheme.caption,
                  )
                ]),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Divider(color: Colors.grey, height: 2, thickness: 1.3),
        )
      ],
    );
  }
}
