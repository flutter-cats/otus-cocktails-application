import 'package:flutter/material.dart';

class DescriptionDetail extends StatelessWidget {
  const DescriptionDetail({Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 8,
          ),
          Chip(
            label: Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFF15151C),
            side: BorderSide(width: 0, color: Color(0xFF15151C)),
            elevation: 0,
            labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ],
      ),
    );
  }
}
