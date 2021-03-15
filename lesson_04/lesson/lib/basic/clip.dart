import 'package:flutter/material.dart';

class ClipSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final image = Image.asset('assets/flutter.png');
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: _buildTriangleClipper(image),
    );
  }

  Widget _buildCircleClipper(Widget child) {
    return ClipOval(child: child);
  }

  Widget _buildRectClipper(Widget child) {
    return ClipRect(child: child);
  }

  Widget _buildRRectClipper(Widget child) {
    return ClipRRect(borderRadius: BorderRadius.circular(24), child: child);
  }

  Widget _buildTriangleClipper(Widget child) {
    return ClipPath(clipper: TriangleClipper(), child: child);
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
