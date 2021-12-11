import 'package:cocktail/ui/search_widgets/res/styles.dart';
import 'package:flutter/material.dart';

class SearchError extends StatelessWidget {
  final String str;
  const SearchError(this.str, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String strl = str;
    return Padding(
      padding: EdgeInsets.only(top: 150),
      child: Text(
        strl,
        style: commonTextStyle(),
      ),
    );
  }
}
