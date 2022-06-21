import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.onPressed, required this.text, required this.icon, this.padding = const EdgeInsets.all(16), this.prefix = ''}) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final String prefix;
  final IconData icon;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon),
                    if (prefix.isNotEmpty) Padding(padding: const EdgeInsets.only(left: 8), child: Text(prefix, maxLines: 1, style: const TextStyle(fontSize: 16))),
                    Flexible(child: Container(padding: const EdgeInsets.only(left: 8), child: Text(text, overflow: TextOverflow.ellipsis, maxLines: 1, style: const TextStyle(fontSize: 16)))),
                  ],
                ))));
  }
}
