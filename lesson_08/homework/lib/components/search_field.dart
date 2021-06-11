import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocktail/style/text_style.dart';

class SearchField extends StatefulWidget {
  final Function(String) changeText;
  final Function() clearText;

  SearchField({@required this.changeText, @required this.clearText});

  @override
  _SearchFieldState createState() =>
      _SearchFieldState(changeText: changeText, clearText: clearText);
}

class _SearchFieldState extends State<SearchField> {
  final String _iconSearch = 'assets/images/icon_search.png';
  final String _iconClose = 'assets/images/icons/icon_close.svg';
  final Function(String) changeText;
  final Function() clearText;
  final _searchFieldTextController = TextEditingController();

  _SearchFieldState({
    this.changeText,
    this.clearText,
  });

  @override
  void initState() {
    _searchFieldTextController.addListener(handleSearchFieldChange);
    super.initState();
  }

  void handleClearPress() {
    _searchFieldTextController.clear();
    clearText();
  }

  void handleSearchFieldChange() {
    changeText(_searchFieldTextController.text);
  }

  get isFieldEmpty => _searchFieldTextController.text.isEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        controller: _searchFieldTextController,
        textAlign: TextAlign.left,
        style: cooklistTextStyle,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(65)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(65)),
          ),
          isDense: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            child: Image.asset(
              _iconSearch,
              width: 25,
              height: 25,
            ),
          ),
          suffixIcon: isFieldEmpty == false
              ? IconButton(
            icon: SvgPicture.asset(
              _iconClose,
              width: 10,
              height: 10,
            ),
            onPressed: handleClearPress,
          )
              : null,
        ),
      ),
    );
  }
}
