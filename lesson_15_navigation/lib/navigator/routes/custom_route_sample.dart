import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages.dart';

class CustomRouteSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootPage(
      title: 'CustomRouteSample',
      onTap: () {
        Navigator.of(context)
            .push(CustomRouteBuilder(enterPage: CustomRouteSample()));
      },
    );
  }
}

class CustomRouteBuilder extends PageRouteBuilder {
  final Widget enterPage;

  CustomRouteBuilder({required this.enterPage})
      : super(
          transitionDuration: Duration(milliseconds: 800),
          reverseTransitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: secondaryAnimation,
                      child: Text('page'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomRouteBuilder(
                            enterPage: CustomRouteSample(),
                          ),
                        );
                      },
                      child: Text('Next'),
                    )
                  ],
                ),
              ),
            );
            return enterPage;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            // print('transitionsBuilder:${animation.status}');
            if (secondaryAnimation.status != AnimationStatus.dismissed) {
              return FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.3)
                    .animate(secondaryAnimation),
                child: child,
              );
            }
            if (animation.status == AnimationStatus.reverse) {
              //print('reverse');
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }

            return SlideTransition(
                position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                    .animate(animation),
                child: child);
          },
        );
}
