

import 'package:flutter/material.dart';

class FilterChipGroup extends StatefulWidget {
  final List<String> items;
  final Function(List<String>)? onSelectionChanged;

  FilterChipGroup({required this.items, this.onSelectionChanged});

  @override
  _FilterChipGroup createState() => _FilterChipGroup(onSelectionChanged);
}

class _FilterChipGroup extends State<FilterChipGroup> {
  List<String> selectedChoices = <String>[];

  _FilterChipGroup(Function(List<String>)? onSelectionChanged) {
    if (onSelectionChanged != null) onSelectionChanged(selectedChoices);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> choiceChips = <Widget>[];
    widget.items.asMap().forEach((index, item) {
      choiceChips.add(choiceChip(item));
    });
    return Container(
        height: 100,
        margin: EdgeInsets.fromLTRB(24, 16, 0, 0),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return choiceChips[index];
            },
            separatorBuilder: (context, _) {
              return SizedBox(width: 10);
            },
            itemCount: widget.items.length));
  }

  Widget choiceChip(String item) {
    return FilterChip(
      label: Text(item),
      key: ValueKey(item.hashCode),
      selected: selectedChoices.contains(item) ? true : false,
      selectedColor: Colors.green,
      showCheckmark: false,
      onSelected: (selected) {
        setState(() {
          selectedChoices.contains(item)
              ? selectedChoices.remove(item)
              : selectedChoices.add(item);
          if (widget.onSelectionChanged != null)
            widget.onSelectionChanged!(selectedChoices); // +added
        });
      },
    );
  }
}