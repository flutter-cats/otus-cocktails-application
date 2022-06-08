import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:numismatist/core/error_handler.dart';

class StartPage extends StatelessWidget with ErrorStatelessHandler {
  const StartPage({Key? key}) : super(key: key);

  static const platform = MethodChannel('numismatist/version');

  Future<String> _getVersion(BuildContext context) async {
    //сходить в платформу за версией
    String version;
    try {
      version = await platform.invokeMethod('getApplicationVersion');
    } on PlatformException {
      version = "?.?.?+0";
    }
    return version;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _getVersion(context),
        builder: (context, AsyncSnapshot<String> snapshot) {
          Future.delayed(const Duration(seconds: 3)).then(
            // ждём 3 секунды на заставке чтобы увидеть версию из платформы )
            (value) => Navigator.of(context).pushNamedAndRemoveUntil(Navigator.defaultRouteName, (route) => false),
          );

          return Scaffold(
              body: SafeArea(
                  child: Center(
            child: Column(
              children: <Widget>[
                const Expanded(flex: 1, child: Text("")),
                Image.asset(
                  "assets/images/coin.png",
                  width: 256,
                  height: 256,
                ),
                Expanded(flex: 1, child: Text((snapshot.hasData) ? snapshot.data! : "", style: Theme.of(context).textTheme.overline))
              ],
            ),
          )));
        });
  }
}
