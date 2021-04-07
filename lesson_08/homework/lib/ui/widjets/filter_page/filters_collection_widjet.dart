import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:cocktail/ui/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FiltersCollectionWidjet extends StatelessWidget {
  final List<FilterModel> filters;
  final Function tapFilter;
  FiltersCollectionWidjet({@required this.filters, @required this.tapFilter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      height: 46,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            children: [
              ...filters.map((e) => FilterCollectionItemWidjet(
                    filterName: e.name,
                    tapFilter: tapFilter,
                    isSelected: e.isSelected,
                  ))
            ]),
      ),
    );
  }
}

class FilterCollectionItemWidjet extends StatelessWidget {
  final String filterName;
  final Function tapFilter;
  final bool isSelected;

  FilterCollectionItemWidjet(
      {@required this.filterName, this.tapFilter, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapFilter(filterName);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: HexColor("#2D2C39")),
            borderRadius: BorderRadius.horizontal(
                left: const Radius.circular(30),
                right: const Radius.circular(30)),
            color: isSelected ? HexColor('#3B3953') : HexColor('#201F2C')),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(filterName,
            style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }
}
