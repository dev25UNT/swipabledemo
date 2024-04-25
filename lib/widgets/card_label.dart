import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipabledemo/colors.dart';

// const _labelAngle = math.pi / 2 * 0.2;
const _angle = 15 * (math.pi / 180);


class CardLabel extends StatelessWidget {
  const CardLabel._({
    required this.color,
    required this.angle,
    required this.assetsImage,
    required this.alignment,
  });

  final Color color;
  final double angle;
  final SvgPicture assetsImage;
  final Alignment alignment;

  factory CardLabel.right() {
    return CardLabel._(
      color: SwipeDirectionColor.right,
      angle: _angle,
      alignment: Alignment.center,
      assetsImage: SvgPicture.asset(
        "assets/icons/swipeRight.svg",
        height: 18.3,
        width: 24.4,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  factory CardLabel.left() {
    return CardLabel._(
      color: SwipeDirectionColor.left,
      angle: _angle,
      alignment: Alignment.center,
      assetsImage: SvgPicture.asset(
        "assets/icons/swipeLeft.svg",
        height: 18.3,
        width: 24.4,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(
        vertical: 36,
        horizontal: 36,
      ),
      child: Transform.rotate(
        angle: angle,
        child: Container(
          height: 83,
          width: 83,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(6),
          child: assetsImage,
        ),
      ),
    );
  }
}
