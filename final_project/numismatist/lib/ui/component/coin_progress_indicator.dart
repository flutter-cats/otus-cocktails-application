import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numismatist/ui/style/colors.dart';

// анимация процесса загрузки
class CoinProgressIndicator extends StatefulWidget {
  final MaterialColor color;
  final double size;
  final double width;
  const CoinProgressIndicator({Key? key, this.color = primaryColor, this.size = 200, this.width = 15}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CoinProgressIndicatorState();
}

class _CoinProgressIndicatorState extends State<CoinProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //value: 0.1,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _controller,
      builder: (_, Widget? childWidget) => SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              child: childWidget,
              painter: CoinProgressIndicatorPainter(
                value: _controller.value,
                color: widget.color,
                size: widget.size,
                width: widget.width,
              ),
            ),
          ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CoinProgressIndicatorPainter extends CustomPainter {
  final MaterialColor color;
  final double value;
  final double size;
  final double width;

  CoinProgressIndicatorPainter({
    required this.value,
    required this.color,
    required this.size,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paintAverse = Paint()..color = color.shade500;
    final paintGurt = Paint()..color = color.shade900;
    final outterOadius = this.size / 2;

    final direction = (value - 0.5).sign;
    final delta = ((value - 0.5) * 2).abs();
    final halfdiff = -direction * 0.5 * width * (1 - delta);

    Path averse = Path();
    averse.addOval(Rect.fromPoints(
      Offset(center.dx - delta * outterOadius + halfdiff, center.dy - outterOadius),
      Offset(center.dx + delta * outterOadius + halfdiff, center.dy + outterOadius),
    ));
    averse.close();
    canvas.drawPath(averse, paintAverse);

    Path gurt = Path();
    gurt.addArc(
      Rect.fromPoints(
        Offset(center.dx - delta * outterOadius + halfdiff, center.dy - outterOadius),
        Offset(center.dx + delta * outterOadius + halfdiff, center.dy + outterOadius),
      ),
      3 * pi / 2,
      direction * pi,
    );
    gurt.lineTo(center.dx + direction * width * (1 - delta) + halfdiff, center.dy + outterOadius);
    gurt.addArc(
      Rect.fromPoints(
        Offset(center.dx - delta * outterOadius + direction * width * (1 - delta) + halfdiff, center.dy - outterOadius),
        Offset(center.dx + delta * outterOadius + direction * width * (1 - delta) + halfdiff, center.dy + outterOadius),
      ),
      5 * pi / 2,
      -direction * pi,
    );
    gurt.lineTo(center.dx + halfdiff, center.dy - outterOadius);

    gurt.close();
    canvas.drawPath(gurt, paintGurt);

    // final ParagraphBuilder paragraphBuilder = ParagraphBuilder(ParagraphStyle(
    //   textAlign: TextAlign.justify,
    // ))
    //   ..addText((halfdiff - 0.5).toStringAsFixed(2));
    // final Paragraph paragraph = paragraphBuilder.build()..layout(ParagraphConstraints(width: size.width - 12.0 - 12.0));
    // canvas.drawParagraph(paragraph, Offset(center.dx, center.dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
