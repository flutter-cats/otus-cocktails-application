import 'package:flutter/material.dart';

class AnimatedHeartIconButton extends StatefulWidget {
  /// Создает анимированный виджет сердечка, при нажати на которое
  /// происходит смена начального цвета [notFavouriteColor] на конечный
  /// цвет [favouriteColor] и анимация увеличения на заданый процент
  /// [scalePercentage] и возвращение в исходное состояние. Начальное состояние
  /// виджета задается параметром [isFavourite]. Размер виджета задается
  /// параметром [size], цвет обводки [outlineColor], длительность анимации
  /// задается параметром [duration] и ширина обводки параметром [outlineWidth]
  /// Обработчик нажатия передается в [onTap]
  /// Аргумент [isFavourite] не должен быть null
  const AnimatedHeartIconButton({
    Key? key,
    required this.isFavourite,
    this.onTap,
    this.size = 18.0,
    this.favouriteColor = Colors.white,
    this.notFavouriteColor = Colors.transparent,
    this.outlineColor = Colors.white,
    this.duration = const Duration(
      milliseconds: 250,
    ),
    this.scalePercentage = 1.2,
    this.outlineWidth = 2.0,
  }) : super(key: key);

  final bool isFavourite;
  final VoidCallback? onTap;
  final Color favouriteColor;
  final Color notFavouriteColor;
  final Color outlineColor;
  final Duration duration;
  final double scalePercentage;
  final double size;
  final double outlineWidth;

  @override
  State<AnimatedHeartIconButton> createState() =>
      _AnimatedHeartIconButtonState();
}

class _AnimatedHeartIconButtonState extends State<AnimatedHeartIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation, _colorForwardAnimation, _colorReverseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween(begin: 1.0, end: widget.scalePercentage),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(begin: widget.scalePercentage, end: 1.0),
          weight: 1,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _colorForwardAnimation =
        ColorTween(begin: widget.notFavouriteColor, end: widget.favouriteColor)
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    _colorReverseAnimation =
        ColorTween(begin: widget.notFavouriteColor, end: widget.favouriteColor)
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    if (widget.isFavourite) {
      _controller.value = 1;
    } else {
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFavourite) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.onTap != null) widget.onTap!();
        });
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return SizedBox(
              width: widget.size,
              height: widget.size,
              child: Transform.scale(
                scale: _sizeAnimation.value,
                child: CustomPaint(
                  painter: HeartPainter(
                    fillColor: widget.isFavourite
                        ? _colorForwardAnimation.value
                        : _colorReverseAnimation.value,
                    outlineColor: widget.outlineColor,
                    outlineWidth: widget.outlineWidth,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HeartPainter extends CustomPainter {
  HeartPainter(
      {required this.fillColor,
      required this.outlineColor,
      required this.outlineWidth});

  Color fillColor;
  Color outlineColor;
  double outlineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Paint border = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = outlineWidth;

    Paint body = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    double width = size.width;
    double height = size.height;

    final Path heartLineArc = Path()
      ..moveTo(0.5 * width, height)
      ..lineTo(width * 0.06, height * 0.45)
      ..arcToPoint(Offset(0.5 * width, height * 0.12),
          radius: Radius.circular(1))
      ..moveTo(0.5 * width, height)
      ..lineTo(width * 0.94, height * 0.45)
      ..arcToPoint(Offset(0.5 * width, height * 0.12),
          radius: Radius.circular(1), clockwise: false);
    canvas
      ..drawPath(heartLineArc, body)
      ..drawPath(heartLineArc, border);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
