import 'package:flutter/material.dart';

import '../builder_delegates.dart';

class PageViewSample extends StatefulWidget {
  @override
  _PageViewSampleState createState() => _PageViewSampleState();
}

class _PageViewSampleState extends State<PageViewSample> {
  final items = List.generate(15, (index) => index);

  final _pageController = PageController(viewportFraction: 0.5, keepPage: true);

  int currentPage = 0;

  @override
  void dispose() {
    // обязательно
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _pageView(context),
    );
  }

  Widget _pageView(BuildContext context) {
    final scrollDirection = Axis.vertical;
    final pageSnapping = true;
    return PageView(
      scrollDirection: scrollDirection,
      controller: _pageController,
      //physics: PageScrollPhysics(),
      //physics: NeverScrollableScrollPhysics(),
      pageSnapping: pageSnapping,
      children: items.map((e) => _PageItem(e)).toList(),
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
    );
  }

  Widget _builderPageView(BuildContext context) {
    return PageView.builder(
      itemCount: 1,
      controller: _pageController,
      itemBuilder: (context, index) => _PageItem(index),
    );
  }

  Widget _customPageView(BuildContext context) {
    return PageView.custom(
      childrenDelegate: cardSliverDelegate,
      controller: _pageController,
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text('page:$currentPage'),
      actions: [
        FlatButton(
            onPressed: () {
              _pageController.animateToPage(10,
                  duration: const Duration(seconds: 1), curve: Curves.linear);
            },
            child: Text('10')),
        FlatButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: const Duration(seconds: 1), curve: Curves.linear);
            },
            child: Text('Back')),
        FlatButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1), curve: Curves.linear);
            },
            child: Text('Next'))
      ],
    );
  }
}

class _PageItem extends StatefulWidget {
  const _PageItem(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  __PageItemState createState() => __PageItemState();
}

class __PageItemState extends State<_PageItem> {
  @override
  void dispose() {
    print('dispose:${widget.index}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('build:${widget.index}');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text('Page:${widget.index}')),
      ),
    );
  }
}
