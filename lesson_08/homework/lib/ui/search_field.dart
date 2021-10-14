import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) onTextChanged;

  SearchField(this.onTextChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorHeight: 14,
        cursorColor: Colors.white,
        onChanged: (value) => onTextChanged(value),
        decoration: getInputDecoration(),
      ),
    );
  }

  InputDecoration getInputDecoration() {
    return InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.search, color: Colors.white),
        suffixIcon: Icon(Icons.close, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(30))));
  }
}
