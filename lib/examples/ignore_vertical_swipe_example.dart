import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swipabledemo/swipable/swipable_stack.dart';
import 'package:swipabledemo/widgets/bottom_buttons_row.dart';
import 'package:swipabledemo/widgets/example_card.dart';
import 'package:swipabledemo/widgets/fade_route.dart';
import 'package:swipabledemo/widgets/general_drawer.dart';

import '../widgets/card_overlay.dart';


const _images = [
  'assets/images/image_5.jpg',
  'assets/images/image_3.jpg',
  'assets/images/image_4.jpg',
];

class IgnoreVerticalSwipeExample extends StatefulWidget {
  const IgnoreVerticalSwipeExample._();

  static Route<void> route() {
    return FadeRoute(
      builder: (context) => const IgnoreVerticalSwipeExample._(),
    );
  }

  @override
  _IgnoreVerticalSwipeExampleState createState() =>
      _IgnoreVerticalSwipeExampleState();
}

class _IgnoreVerticalSwipeExampleState
    extends State<IgnoreVerticalSwipeExample> {
  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IgnoreVerticalSwipeExample'),
      ),
      drawer: const GeneralDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SwipableStack(
                  controller: _controller,
                  stackClipBehaviour: Clip.none,
                  allowVerticalSwipe: false,
                  onWillMoveNext: (index, swipeDirection) {
                    // Return true for the desired swipe direction.
                    switch (swipeDirection) {
                      case SwipeDirection.left:
                      case SwipeDirection.right:
                        return true;
                      case SwipeDirection.up:
                      case SwipeDirection.down:
                        return false;
                    }
                  },
                  onSwipeCompleted: (index, direction) {
                    if (kDebugMode) {
                      print('$index, $direction');
                    }
                  },
                  horizontalSwipeThreshold: 0.8,
                  // Set max value to ignore vertical threshold.
                  verticalSwipeThreshold: 1,
                  overlayBuilder: (
                      context,
                      properties,
                      ) =>
                      CardOverlay(
                        swipeProgress: properties.swipeProgress,
                        direction: properties.direction,
                      ),
                  builder: (context, properties) {
                    final itemIndex = properties.index % _images.length;
                    return ExampleCard(
                      name: 'Sample No.${itemIndex + 1}',
                      assetPath: _images[itemIndex],
                    );
                  },
                ),
              ),
            ),
            BottomButtonsRow(
              onSwipe: (direction) {
                _controller.next(swipeDirection: direction);
              },
              onRewindTap: _controller.rewind,
              canRewind: _controller.canRewind,
            ),
          ],
        ),
      ),
    );
  }
}