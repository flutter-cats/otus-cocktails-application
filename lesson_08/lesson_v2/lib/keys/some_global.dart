import 'package:flutter/cupertino.dart';

class SomeGlobal extends StatefulWidget {
  const SomeGlobal({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  _SomeGlobalState createState() {
    return _SomeGlobalState();
  }
}

class _SomeGlobalState extends State<SomeGlobal> {
  void doSomething() {
    print('LALALa');
  }

  @override
  void initState() {
    super.initState();
    print('SOME GLOBAL INIT');
  }

  @override
  void setState(VoidCallback fn) {
    print('SOME GLOBAL SET STATE');
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
