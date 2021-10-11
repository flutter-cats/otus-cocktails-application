import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HeartPainter extends CustomPainter {

  final PaintingStyle paintingStyle;

  HeartPainter(this.paintingStyle);

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.7395840,size.height*0.04166602);
    path_0.cubicTo(size.width*0.6286621,size.height*0.04166602,size.width*0.5370488,size.height*0.1446934,size.width*0.5000000,size.height*0.1933184);
    path_0.cubicTo(size.width*0.4629512,size.height*0.1446934,size.width*0.3713379,size.height*0.04166602,size.width*0.2604160,size.height*0.04166602);
    path_0.cubicTo(size.width*0.1168223,size.height*0.04166602,0,size.height*0.1736855,0,size.height*0.3359375);
    path_0.cubicTo(0,size.height*0.4244590,size.width*0.03513672,size.height*0.5069570,size.width*0.09663867,size.height*0.5634160);
    path_0.cubicTo(size.width*0.09753320,size.height*0.5649629,size.width*0.09863281,size.height*0.5663867,size.width*0.09991406,size.height*0.5676680);
    path_0.lineTo(size.width*0.4852910,size.height*0.9522500);
    path_0.cubicTo(size.width*0.4893594,size.height*0.9562988,size.width*0.4946699,size.height*0.9583340,size.width*0.5000000,size.height*0.9583340);
    path_0.cubicTo(size.width*0.5053301,size.height*0.9583340,size.width*0.5106602,size.height*0.9562988,size.width*0.5147305,size.height*0.9522305);
    path_0.lineTo(size.width*0.9129238,size.height*0.5541797);
    path_0.lineTo(size.width*0.9170332,size.height*0.5501914);
    path_0.cubicTo(size.width*0.9202891,size.height*0.5471191,size.width*0.9235039,size.height*0.5440059,size.width*0.9271035,size.height*0.5400195);
    path_0.cubicTo(size.width*0.9286094,size.height*0.5385352,size.width*0.9298496,size.height*0.5368652,size.width*0.9308066,size.height*0.5350547);
    path_0.cubicTo(size.width*0.9754648,size.height*0.4803672,size.width,size.height*0.4098301,size.width,size.height*0.3359375);
    path_0.cubicTo(size.width,size.height*0.1736855,size.width*0.8831797,size.height*0.04166602,size.width*0.7395840,size.height*0.04166602);
    path_0.close();



    final paint = Paint()
      ..color = Colors.white
      ..style = paintingStyle
      ..strokeWidth = 1.6;
    canvas.drawPath(path_0,paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}