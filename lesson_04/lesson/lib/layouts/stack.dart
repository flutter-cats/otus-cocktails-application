import 'package:flutter/material.dart';
import 'package:lesson/layouts/utils.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: _buildPositionedSample());
  }

  //Align
  Widget _buildAlignSample() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        _buildAlign(Alignment.center),
        _buildAlign(Alignment.bottomCenter),
        _buildAlign(Alignment.topCenter),
        _buildAlign(Alignment.topLeft),
        _buildAlign(Alignment.topRight),
        _buildAlign(Alignment.centerLeft),
        _buildAlign(Alignment.centerRight),
        _buildAlign(Alignment.bottomRight),
        _buildAlign(Alignment.bottomLeft),
      ],
    );
  }

  Widget _buildCustomAlignSample() {
    return Stack(
      children: [
        _buildAlign(Alignment(0.99, 0.0)),
        _buildAlign(Alignment(0.0, 0.99)),
        _buildAlign(Alignment(-0.99, 0.0)),
        _buildAlign(Alignment(-0.0, -0.99)),
        _buildAlign(Alignment(-0.0, -0.001)),
      ],
    );
  }

  Widget _buildPositionedSample() {
    return Stack(
      // fit: StackFit.loose,
      children: [
        // SizedBox(height: 100, width: 100),
        Positioned(
          left: 16,
          top: 16,
          child: RectWidget(Colors.red),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: RectWidget(Colors.green),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: RectWidget(Colors.blue),
        ),
        Positioned(
          left: 16,
          bottom: 16,
          child: RectWidget(Colors.yellow),
        )
      ],
    );
  }

  Widget _buildAlign(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(8),
        child: Text(alignment
            .toString()
            .replaceAll(alignment.runtimeType.toString(), '')),
      ),
    );
  }
}

class _SampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      color: Colors.grey,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/flutter.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: -26,
            right: -26,
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 48,
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
