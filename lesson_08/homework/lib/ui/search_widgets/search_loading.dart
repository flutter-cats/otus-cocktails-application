import 'package:cocktail/ui/search_widgets/res/styles.dart';
import 'package:flutter/material.dart';

class SearchLoadingScreen extends StatelessWidget {
  const SearchLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 150),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.leak_add_rounded,
            color: Colors.white,
            size: 45,
          ),
          Text(
            'Поиск...',
            style: commonTextStyle(),
          )
        ],
      ),
    );
  }
}
