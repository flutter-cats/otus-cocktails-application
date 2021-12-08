import 'package:cocktail/ui/search_widgets/res/styles.dart';
import 'package:flutter/material.dart';

class SearchError extends StatelessWidget {
  const SearchError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 150),
      child: Text(
        'Ошибка...',
        style: commonTextStyle(),
      ),
    );
  }
}
