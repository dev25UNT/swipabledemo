import 'package:flutter/material.dart';
import 'package:swipabledemo/swipable/swipable_stack.dart';
import 'package:swipabledemo/widgets/bottom_buttons_row.dart';
import 'package:swipabledemo/widgets/example_card.dart';
import 'package:swipabledemo/widgets/fade_route.dart';
import 'package:swipabledemo/widgets/general_drawer.dart';

import '../widgets/card_overlay.dart';

const _images = [
  'assets/images/image_1.jpg',
  'assets/images/image_2.jpg',
  'assets/images/image_3.jpg',
  'assets/images/image_4.jpg',
  'assets/images/image_5.jpg',
  'assets/images/image_6.jpg',
  'assets/images/image_7.jpg',
  'assets/images/image_8.jpg',
  'assets/images/image_9.jpg',
  'assets/images/image_10.jpg',
  'assets/images/image_11jpg',
  'assets/images/image_12.jpg',
];

class DetectableDirectionsExamplePhaseTwo extends StatefulWidget {
  const DetectableDirectionsExamplePhaseTwo._();

  static Route<void> route() {
    return FadeRoute(
      builder: (context) => const DetectableDirectionsExamplePhaseTwo._(),
    );
  }

  @override
  _DetectableDirectionsExamplePhaseTwoState createState() => _DetectableDirectionsExamplePhaseTwoState();
}

class _DetectableDirectionsExamplePhaseTwoState extends State<DetectableDirectionsExamplePhaseTwo> {
  late final SwipableStackController _controller;
  int selectedIndex = 0;
  bool isSwiping = false;
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
        title: const Text('DetectableDirectionsExamplePhaseTwo'),
      ),
      drawer: const GeneralDrawer(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
             if(!isSwiping)backImage(selectedIndex),

            SizedBox(
              width: 350,
              height: 438,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SwipableStack(
                  // viewFraction: 1,
                  detectableSwipeDirections: const {
                    SwipeDirection.right,
                    SwipeDirection.left,
                  },
                  controller: _controller,
                  stackClipBehaviour: Clip.none,
                  onSwipeCompleted: (index, direction) {
                    // if (kDebugMode) {
                    //   print('$index, $direction');
                    // }
                    selectedIndex = index;
                    setState(() {
                      isSwiping = false; // Set swiping status to false when swipe completes
                    });
                  },
                  onWillMoveNext: (index,direction){
                    setState(() {
                      isSwiping = true; // Set swiping status to true when swipe starts
                    });
                    print("selected indes is ==> ${index}");
                    return true;
                  },
                  horizontalSwipeThreshold: 0.8,
                  verticalSwipeThreshold: 0.8,
                  builder: (context, properties) {
                    final itemIndex = properties.index % _images.length;
                    // backImage(_images[itemIndex]);
                    // print("Image is ==> ${_images[itemIndex]}");
                    return Stack(
                      children: [
                        ExampleCard(
                          name: 'Sample No.${itemIndex + 1}',
                          assetPath: _images[itemIndex],
                        ),

                        ///For Left && Right Swipe Icons
                        if (properties.stackIndex == 0 && properties.direction != null)
                          CardOverlay(
                            swipeProgress: properties.swipeProgress,
                            direction: properties.direction!,
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  backImage(int? assetImg) {
    print(selectedIndex);
    return Padding(
      padding: const EdgeInsets.only(bottom: 81, left: 21, right: 21),
      child: Container(
        width: 308, // Adjust width as needed
        height: 384,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          image: DecorationImage(
              // image: AssetImage(
              //   'assets/images/image_4.jpg',
              // ),
              image: AssetImage(
                _images[selectedIndex + 2],
              ),
              fit: BoxFit.cover,
              opacity: 0.6),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 26,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}
