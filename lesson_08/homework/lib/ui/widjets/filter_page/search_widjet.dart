import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchFiedlWidjet extends StatefulWidget {
  @override
  _SearchFiedlWidjetState createState() => _SearchFiedlWidjetState();
}

class _SearchFiedlWidjetState extends State<SearchFiedlWidjet> {
  OutlineInputBorder get borderStyle {
    return OutlineInputBorder(
      borderSide: BorderSide(color: HexColor("#464551")),
      borderRadius: const BorderRadius.all(Radius.circular(65)),
    );
  }

  bool isTapTextField = false;

  bool get isTextEmpty {
    return _searchTextController.text.isEmpty;
  }

  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        child: TextField(
          controller: _searchTextController,
          style: TextStyle(color: Colors.white, fontSize: 13),
          cursorColor: Colors.white,
          cursorHeight: 10,
          decoration: InputDecoration(
            isDense: true,
            focusedBorder: borderStyle,
            enabledBorder: borderStyle,
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: Image.asset(
                'assets/images/search.png',
                width: 25,
                height: 25,
              ),
            ),
            suffixIcon: isTapTextField && isTextEmpty == false
                ? IconButton(
                    icon: Image.asset(
                      'assets/images/close.png',
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {
                      _searchTextController.clear();
                      print("Cancel text");
                    },
                  )
                : null,
          ),
          onChanged: (text) {
            setState(() {});
          },
          onTap: () {
            setState(() {
              isTapTextField = true;
            });
          },
          onSubmitted: (value) {
            FocusScope.of(context).unfocus();
            setState(() {
              isTapTextField = false;
            });
          },
        ));
  }
}
