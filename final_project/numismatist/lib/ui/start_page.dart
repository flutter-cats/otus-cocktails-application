import 'package:flutter/material.dart';

import 'package:numismatist/core/error_handler.dart';

class StartPage extends StatelessWidget with ErrorStatelessHandler {
  const StartPage({Key? key}) : super(key: key);

  Future<String> _getVersion(BuildContext context) async {
    //TODO сходить в платформу за версией
    //PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "0.0.0.0"; //"${packageInfo.appName} ${packageInfo.version}+${packageInfo.buildNumber}";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _getVersion(context),
        builder: (context, AsyncSnapshot<String> snapshot) {
          Future.delayed(const Duration(seconds: 3)).then(
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
