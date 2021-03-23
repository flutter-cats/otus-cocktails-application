import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../builder_delegates.dart';

class SliversPersistentHeaderSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PersistentHeader')),
      body: CustomScrollView(
        slivers: [
          _buildHeader('header 1'),
          SliverGrid(
            delegate: cardSliverListDelegate,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
          _buildHeader('header 2'),
          SliverList(
            delegate: cardSliverDelegate,
          ),
          _buildHeader('header 3'),
          SliverList(
            delegate: cardSliverDelegate,
          ),
        ],
      ),
    );
  }

  SliverPersistentHeader _buildHeader(String headerText) {
    return SliverPersistentHeader(
      floating: false,
      pinned: false,
      delegate: HeaderDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Text(headerText),
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  HeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxHeight,
      color: _calculateColor(shrinkOffset),
      child: Center(child: child),
    );
    return Container(
        color: Colors.lightBlue,
        child: Center(
            child: Text(
                'shrinkOffset:${shrinkOffset.toString()} overlapsContent:$overlapsContent')));
  }

  Color _calculateColor(double shrinkOffset) {
    return Colors.lightBlue.withRed(shrinkOffset.toInt());
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

