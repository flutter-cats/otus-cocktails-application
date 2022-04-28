import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: CircleBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: child,
      ),
    );
  }
}