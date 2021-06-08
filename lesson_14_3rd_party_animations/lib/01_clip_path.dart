import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.79);
    path.quadraticBezierTo(size.width * 0.21, size.height * 0.64,
        size.width * 0.25, size.height * 0.57);
    path.cubicTo(size.width * 0.30, size.height * 0.55, size.width * 0.41,
        size.height * 0.52, size.width * 0.46, size.height * 0.50);
    path.cubicTo(size.width * 0.46, size.height * 0.65, size.width * 0.58,
        size.height * 0.64, size.width * 0.58, size.height * 0.50);
    path.cubicTo(size.width * 0.64, size.height * 0.52, size.width * 0.74,
        size.height * 0.55, size.width * 0.79, size.height * 0.57);
    path.quadraticBezierTo(size.width * 0.83, size.height * 0.61,
        size.width * 0.79, size.height * 0.79);
    path.lineTo(size.width * 0.25, size.height * 0.79);
    path.close();

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2575000, size.height * 0.3314286);
    path_0.cubicTo(
        size.width * 0.2543750,
        size.height * 0.5564286,
        size.width * 0.1630750,
        size.height * 0.3474429,
        size.width * 0.2540583,
        size.height * 0.7080286);
    path_0.cubicTo(
        size.width * 0.2763500,
        size.height * 0.7480286,
        size.width * 0.2057250,
        size.height * 0.8989000,
        size.width * 0.3425000,
        size.height * 0.7914286);
    path_0.cubicTo(
        size.width * 0.3949042,
        size.height * 0.7392500,
        size.width * 0.4960750,
        size.height * 0.6395000,
        size.width * 0.5521167,
        size.height * 0.5827143);
    path_0.cubicTo(
        size.width * 0.6413667,
        size.height * 0.4932143,
        size.width * 0.5366167,
        size.height * 0.3839286,
        size.width * 0.4850000,
        size.height * 0.4242857);
    path_0.cubicTo(
        size.width * 0.4564583,
        size.height * 0.4553571,
        size.width * 0.3993750,
        size.height * 0.5175000,
        size.width * 0.3708333,
        size.height * 0.5485714);
    path_0.cubicTo(
        size.width * 0.3454583,
        size.height * 0.5777571,
        size.width * 0.3131167,
        size.height * 0.5260714,
        size.width * 0.3233333,
        size.height * 0.4542857);
    path_0.cubicTo(
        size.width * 0.3249500,
        size.height * 0.3855143,
        size.width * 0.4791750,
        size.height * 0.3448143,
        size.width * 0.4266667,
        size.height * 0.3228571);
    path_0.quadraticBezierTo(size.width * 0.3906250, size.height * 0.3182143,
        size.width * 0.2825000, size.height * 0.3042857);
    path_0.quadraticBezierTo(size.width * 0.2648583, size.height * 0.2996000,
        size.width * 0.2575000, size.height * 0.3314286);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => true;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Animations - Clip Path Demo'),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 400,
          child: ClipPath(
            clipper: MyClipPath(),
            child: Image.asset('assets/images/macbook.jpg'),
          ),
        ),
      ),
    );
  }
}
