import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class LottieFramePainer extends StatelessWidget {
  final LottieComposition composition;
  final int frame;

  const LottieFramePainer(this.composition, this.frame, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: _Painter(composition, frame),
      size: size,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late LottieComposition _composition;
  late double _frames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Animations - Lottie'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: _frames.toInt(),
          itemBuilder: (_, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text((index + 1).toString()),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    child: LottieFramePainer(_composition, index),
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadComposition();
  }

  Future<void> _loadComposition() async {
    var assetData = await rootBundle.load('assets/lottie/cat-preloader.json');

    _composition = await LottieComposition.fromByteData(assetData);
    _frames = _composition.durationFrames;

    setState(() {});
  }
}

class _Painter extends CustomPainter {
  final LottieDrawable drawable;
  final int frame;

  _Painter(LottieComposition composition, this.frame)
      : drawable = LottieDrawable(composition);

  @override
  void paint(Canvas canvas, Size size) {
    var frameCount = 49;
    var destRect = Offset(0, 0) & (size);
    drawable
      ..setProgress(frame / frameCount)
      ..draw(canvas, destRect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
