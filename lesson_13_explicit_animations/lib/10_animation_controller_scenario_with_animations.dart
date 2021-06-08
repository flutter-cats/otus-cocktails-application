import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ///
  /// Явно заданный контроллер анимации, задачей которого
  /// является запуск или прекращение анимации
  ///
  late AnimationController _controller;

  ///
  /// Явным образом заданные анимации, задачей которых является
  /// генерация значений (в зависимости от примененной кривой)
  ///
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<Color> _colorAnimation;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    ///
    /// uncomment this
    ///
    // _scaleAnimation = Animation();
    // _rotateAnimation = Animation();
    // _colorAnimation = Animation();
    // _alignmentAnimation = Animation();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotateAnimation.value,

      child: Transform.scale(
        scale: _scaleAnimation.value,

        child: Container(
          alignment: _alignmentAnimation.value,
          color: _colorAnimation.value,

          child: FlutterLogo(),
        ),
      ),
    );
  }
}
