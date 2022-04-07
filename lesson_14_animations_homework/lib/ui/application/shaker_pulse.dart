import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class ShakerPulse extends StatefulWidget {
  const ShakerPulse({Key? key, required this.maxIconSize, required this.durationMilliseconds}) : super(key: key);
  
  final int durationMilliseconds;
  final double maxIconSize;
  @override
  _ShakerPulseState createState() => _ShakerPulseState();
}

class _ShakerPulseState extends State<ShakerPulse>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _rotationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.durationMilliseconds));
     _rotationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 180 ))..repeat(reverse: true);    

    _scaleAnimation = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _opacityAnimation = ReverseAnimation(_scaleAnimation);
    _rotateAnimation =Tween(begin: -0.1, end: 0.2).animate(CurvedAnimation(parent: _rotationController, curve: Curves.linear));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: RotationTransition( turns: _rotateAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SvgPicture.asset('assets/shaker.svg', width: widget.maxIconSize, height: widget.maxIconSize, ),
        ),
      ),
    );
  }
}
