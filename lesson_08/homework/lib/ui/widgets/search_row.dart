import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 22),
      padding: EdgeInsets.only(left: 20, right: 16),
      decoration: BoxDecoration(
          color: Color(0xFF181723),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Color(0xFF464551),
            width: 1,
          )),
      child: TextField(
        maxLines: 1,
        showCursor: true,
        autofocus: false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(color: Colors.white, fontSize: 13),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            isDense: true,
            suffixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            suffixIcon: Icon(
              Icons.clear,
              color: Color(0xFF464551),
              size: 20,
            ),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            icon: Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 20,
            )),
      ),
    );
  }
}
