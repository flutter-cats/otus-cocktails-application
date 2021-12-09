import 'package:cocktail/core/src/globals.dart';
import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: EdgeInsets.fromLTRB(16, 42, 16, 16),
      child: TextField(
        onChanged: (value) {
          Globals.inSearch = value;
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          enabledBorder: shapeOfBorder,
          focusedBorder: shapeOfBorder,
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.clear,
              color: clearIconColor,
              size: 18,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
      ),
    );
  }
}

const shapeOfBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: textFieldOfSearchColor,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(25),
  ),
);
