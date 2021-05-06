import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';

class SingleFilter extends StatelessWidget {
  final String activeFilter;
  final Map<String, String> filters;
  final Function setActiveFilter;

  SingleFilter({
    this.activeFilter,
    this.filters,
    this.setActiveFilter,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> filtersList = [];

    filters.forEach((key, value) => filtersList.add(_buildFilter(
          text: value,
          isSelected: value == activeFilter,
          setActiveFilter: () => setActiveFilter(value),
        )));

    return Container(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: filtersList,
      ),
    );
  }

  Widget _buildFilter({text, isSelected, setActiveFilter}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.border,
        ),
        color: isSelected ? AppColors.active : AppColors.primary,
      ),
      child: TextButton(
        onPressed: setActiveFilter,
        child: Text(text),
        style: TextButton.styleFrom(
          primary: AppColors.primaryText,
          padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        ),
      ),
    );
  }
}
