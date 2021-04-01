import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TextFieldsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFields"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: _TextFieldsList(),
        ),
      ),
    );
  }
}

class _TextFieldsList extends StatelessWidget {
  const _TextFieldsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline5;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "CupertinoTextField:",
            style: textStyle,
          ),
          CupertinoTextField(
            keyboardAppearance: Brightness.dark,
          ),
          const SizedBox(height: 24),
          Text(
            "TextField:",
            style: textStyle,
          ),
          ..._buildTextFields(),
        ],
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      TextField(
        keyboardType: TextInputType.url,
        textInputAction: TextInputAction.done,
      ),
      const SizedBox(height: 8),
      TextField(
        minLines: 3,
        maxLines: 5,
      ),
      const SizedBox(height: 8),
      TextField(
        obscureText: true,
      ),
      const SizedBox(height: 8),
      TextField(
        inputFormatters: [
          FilteringTextInputFormatter(
            RegExp(r"^\d+$"),
            allow: true,
          ),
        ],
      ),
      const SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          fillColor: Colors.yellow.withOpacity(0.1),
          filled: true,
          suffixIcon: Icon(Icons.build),
          isDense: true,
          counterText: "10 / 500",
          labelText: "Your name",
          hintText: "Start typing",
        ),
      ),
      const SizedBox(height: 8),
    ];
  }
}
