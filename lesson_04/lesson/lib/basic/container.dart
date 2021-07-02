import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildSquare(),
    );
  }

  Widget _buildSquare() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.grey,
      child: Text('Text'),
    );
  }

  Widget _buildRRect() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 5.0),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          bottomRight: const Radius.circular(16),
        ),
      ),
      child: Text('Text'),
    );
  }

  Widget _buildCircle() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text('Text'),
    );
  }

  Widget _buildMultiContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.green,
      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Icon(
          Icons.verified_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
