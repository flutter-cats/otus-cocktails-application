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
    final textStyle = Theme.of(context).textTheme.subtitle1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "CupertinoTextField:",
            style: textStyle,
          ),
          CupertinoTextField(),
          const SizedBox(height: 24),
          Text(
            "TextField:",
            style: textStyle,
          ),
          ..._buildTextFields(),
          const SizedBox(height: 24),
          _TextFieldExample(),
        ],
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      TextField(),
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

class _TextFieldExample extends StatefulWidget {
  @override
  __TextFieldExampleState createState() => __TextFieldExampleState();
}

class __TextFieldExampleState extends State<_TextFieldExample> {
  final TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode = FocusNode(onKey: _onKey);

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print(_controller.text);
    });

    _focusNode.addListener(() {
      print(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      maxLines: null,
    );
  }

  bool _onKey(FocusNode node, RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return false;

    final isBackspacePressed = event.isKeyPressed(LogicalKeyboardKey.backspace);
    final selection = _controller.selection;
    final isCaretAtStart = selection.start == 0 && selection.end == 0;

    if (isBackspacePressed && isCaretAtStart) {
      _focusNode.unfocus();
      return true;
    }

    final isEnterPressed = event.isKeyPressed(LogicalKeyboardKey.enter);
    final isRangeSelected = selection.start != selection.end;

    if (isEnterPressed && isRangeSelected) {
      const replacement = "ENTER";
      final newText = _controller.value.text.replaceRange(
        _controller.value.selection.start,
        _controller.value.selection.end,
        replacement,
      );
      final caretPosition = _controller.selection.start + replacement.length;
      final newSelection = TextSelection(
        baseOffset: caretPosition,
        extentOffset: caretPosition,
      );
      _controller.value = _controller.value.copyWith(
        text: newText,
        selection: newSelection,
      );
      return true;
    }

    return false;
  }
}
