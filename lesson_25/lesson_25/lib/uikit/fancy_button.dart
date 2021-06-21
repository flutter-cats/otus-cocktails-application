import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Constants {
  static const borderRadius = Radius.circular(10);
}

class FancyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const FancyButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        side:
            MaterialStateProperty.all(BorderSide(color: Colors.pink, width: 5)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Constants.borderRadius),
          ),
        ),
      ),
      child: Text(
        title,
      ),
    );
  }
}
