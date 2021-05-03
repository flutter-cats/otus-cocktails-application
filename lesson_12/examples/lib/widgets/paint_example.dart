import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PaintExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: _buildGradientPainter(),
        // child: ImageShaderExample(),
        // ==========
        // child: _buildMaskFilterPainter(),
        // child: ImageFilterExample(),
        // child: _buildStrokePainter(),
      ),
    );
  }

  Widget _buildGradientPainter() {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: LinearGradientPainter(),
        // painter: RadialGradientPainter(),
        // painter: SweepGradientPainter(),
      ),
    );
  }

  Widget _buildMaskFilterPainter() {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: MaskFilterPainter(),
        // painter: DropShadowPainter(),
      ),
    );
  }

  Widget _buildStrokePainter() {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: StrokePainter(),
      ),
    );
  }
}

class LinearGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(0, size.height),
        Offset(size.width, 0),
        [Colors.red, Colors.yellow, Colors.blue],
        [0, 0.5, 1],
      );

    final rect = Offset.zero & size;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RadialGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.radial(
        Offset(size.width / 2, size.height / 2),
        size.width / 2,
        [Colors.red, Colors.yellow, Colors.orangeAccent],
        [0, 0.5, 1],
        // TileMode.mirror,
      );

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SweepGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2),
        [Colors.red, Colors.yellow, Colors.blueAccent, Colors.red],
        [0, 0.3, 0.7, 1],
      );

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ImageShaderExample extends StatefulWidget {
  @override
  _ImageShaderExampleState createState() => _ImageShaderExampleState();
}

class _ImageShaderExampleState extends State<ImageShaderExample> {
  late Future<ui.Image> _imageFuture;

  @override
  void initState() {
    super.initState();

    _imageFuture = _loadImage();
  }

  Future<ui.Image> _loadImage() async {
    final bytes = await rootBundle.load('assets/image.jpg');
    final list = bytes.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(list);
    return (await codec.getNextFrame()).image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _imageFuture,
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (!snapshot.hasData) return Container();

        return Container(
          height: 500,
          width: 500,
          child: CustomPaint(
            painter: ImageShaderPainter(snapshot.data!),
          ),
        );
      },
    );
  }
}

class ImageShaderPainter extends CustomPainter {
  final ui.Image image;

  ImageShaderPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ImageShader(
        image,
        TileMode.decal,
        TileMode.repeated,
        Matrix4.identity().storage,
      );

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ImageShaderPainter oldDelegate) =>
      this.image != oldDelegate.image;
}

class MaskFilterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(0, size.height),
        Offset(size.width, 0),
        [Colors.red, Colors.yellow, Colors.blue],
        [0, 0.5, 1],
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DropShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);
    final shadowRect = Offset(30, 20) & (size / 2);
    canvas.drawRect(shadowRect, shadowPaint);

    final rect = Offset.zero & (size / 2);
    final mainPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    canvas.drawRect(rect, mainPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ImageFilterExample extends StatefulWidget {
  @override
  _ImageFilterExampleState createState() => _ImageFilterExampleState();
}

class _ImageFilterExampleState extends State<ImageFilterExample> {
  late Future<ui.Image> _imageFuture;

  @override
  void initState() {
    super.initState();

    _imageFuture = _loadImage();
  }

  Future<ui.Image> _loadImage() async {
    final bytes = await rootBundle.load('assets/image.jpg');
    final list = bytes.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(list);
    return (await codec.getNextFrame()).image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _imageFuture,
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (!snapshot.hasData) return Container();

        return Container(
          height: 200,
          width: 300,
          child: CustomPaint(
            painter: ImageFilterPainter(snapshot.data!),
          ),
        );
      },
    );
  }
}

class ImageFilterPainter extends CustomPainter {
  final ui.Image image;

  ImageFilterPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ImageShader(
        image,
        TileMode.repeated,
        TileMode.repeated,
        Matrix4.identity().storage,
      )
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10);

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ImageFilterPainter oldDelegate) =>
      this.image != oldDelegate.image;
}

class StrokePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 30
          ..strokeCap = StrokeCap.round
          // ..strokeCap = StrokeCap.square
          ..strokeJoin = StrokeJoin.miter
          // ..strokeJoin = StrokeJoin.round
          // ..strokeJoin = StrokeJoin.bevel
          ..color = Colors.red
        // ..shader = ui.Gradient.sweep(
        //   Offset(size.width / 2, size.height / 2),
        //   [Colors.red, Colors.yellow, Colors.blue, Colors.red],
        //   [0, 0.3, 0.7, 1],
        // )
        ;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
