import 'package:flutter/material.dart';

class FilterChipGroup extends StatefulWidget {
  final List<String> items;
  final Function(List<String>)? onSelectionChanged;
  final List<String>? preselectedItems;

  FilterChipGroup(
      {required this.items, this.onSelectionChanged, this.preselectedItems});

  @override
  _FilterChipGroupState createState() =>
      _FilterChipGroupState(onSelectionChanged, preselectedItems);
}

class _FilterChipGroupState extends State<FilterChipGroup> {
  List<String> selectedChoices = <String>[];

  _FilterChipGroupState(Function(List<String>)? onSelectionChanged,
      List<String>? preselectedItems) {
    if (preselectedItems != null) {
      selectedChoices.addAll(preselectedItems);
    }
    if (onSelectionChanged != null) onSelectionChanged(selectedChoices);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> choiceChips = <Widget>[];
    widget.items.asMap().forEach((index, item) {
      choiceChips.add(choiceChip(item));
    });
    return Container(
        height: 50,
        margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
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
      label: Container(
          height: 40,
          child: Align(
              alignment: Alignment.center,
              child: Text(item, style: TextStyle(color: Colors.white)))),
      selected: isSelected(item),
      selectedColor: Color(0xFF3B3953),
      backgroundColor: Color(0xFF201F2C),
      showCheckmark: false,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: StadiumBorder(
          side: BorderSide(
              color: (isSelected(item) ? Colors.black : Colors.grey))),
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

  bool isSelected(String item) => selectedChoices.contains(item) ? true : false;
}
