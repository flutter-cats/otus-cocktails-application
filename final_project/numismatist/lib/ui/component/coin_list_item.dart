import 'package:flutter/material.dart';
import 'package:numismatist/repository/models/currency.dart';
import 'package:numismatist/repository/models/item.dart';

class CoinListItem extends StatelessWidget {
  final Item item;
  final GestureTapCallback? onTap;

  const CoinListItem(this.item, {this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: Column(
        children: [
          InkWell(
            onTap: onTap ?? () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (item.averse != null)
                        Hero(
                          tag: item.id,
                          child: Image.memory(item.averse!, height: 100, width: 100),
                        ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Flexible(
                                    child: Text(
                                      item.name,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '${item.nominal}${item.currency.toSymbol()}',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  )
                                ]),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Flexible(
                                    child: Text(
                                      item.material,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                  Text(
                                    item.id,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(color: Colors.grey, height: 2, thickness: 1.3),
          )
        ],
      ),
    );
  }
}
