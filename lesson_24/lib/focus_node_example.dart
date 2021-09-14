import 'package:flutter/material.dart';

class FocusNodeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
            ),
          ),
          child: _SimpleFormContent(),
          // child: _TwoFormsContent(),
          // child: _CustomTraversalOrder(),
        ),
      ),
    );
  }
}

class _SimpleFormContent extends StatefulWidget {
  const _SimpleFormContent({Key? key}) : super(key: key);

  @override
  __SimpleFormContentState createState() => __SimpleFormContentState();
}

class __SimpleFormContentState extends State<_SimpleFormContent> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: FocusTraversalGroup(
        policy: ReadingOrderTraversalPolicy(),
        // policy: WidgetOrderTraversalPolicy(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(),
                      const SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                ),
                const SizedBox(width: 64),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(),
                      const SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),
            CheckboxListTile(
              value: _isChecked,
              onChanged: (value) {
                setState(() => _isChecked = value ?? false);
              },
              title: Text("Согласен с пользовательским соглашением"),
            ),
            const SizedBox(height: 42),
            ElevatedButton(
              onPressed: () {},
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class _TwoFormsContent extends StatelessWidget {
  const _TwoFormsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              // FocusScope
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(),
                  const SizedBox(height: 16),
                  TextField(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Log in"),
                  ),
                ],
              ),
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 4,
          color: Colors.black,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              // FocusScope
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(),
                  const SizedBox(height: 16),
                  TextField(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Sign up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomTraversalOrder extends StatelessWidget {
  const _CustomTraversalOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      // policy: OrderedTraversalPolicy(),
      child: Stack(
        children: [
          Positioned(
            left: 50,
            top: 100,
            child: _FocusableItem(order: 2),
          ),
          Positioned(
            left: 220,
            top: 300,
            child: _FocusableItem(order: 1),
          ),
          Positioned(
            left: 420,
            top: 200,
            child: _FocusableItem(order: 3),
          ),
          Positioned(
            left: 100,
            top: 250,
            child: _FocusableItem(order: 4),
          ),
        ],
      ),
    );
  }
}

class _FocusableItem extends StatefulWidget {
  final int order;

  const _FocusableItem({Key? key, required this.order}) : super(key: key);

  @override
  __FocusableItemState createState() => __FocusableItemState();
}

class __FocusableItemState extends State<_FocusableItem> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: NumericFocusOrder(widget.order.toDouble()),
      child: Focus(
        onFocusChange: (value) {
          setState(() => _isFocused = value);
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: _isFocused ? Colors.blue : Colors.transparent,
              width: 4,
            ),
          ),
          child: Center(
            child: Text(
              widget.order.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
