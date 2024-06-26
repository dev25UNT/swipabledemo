import 'package:flutter/material.dart';

import 'bottom_buttons_row.dart';


class ExampleCard extends StatelessWidget {
  const ExampleCard({
    required this.name,
    required this.assetPath,
    super.key,
  });

  final String name;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      child: Stack(
        children: [
          // Positioned.fill(
          //   child: DecoratedBox(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(14),
          //       image: DecorationImage(
          //         image: AssetImage(assetPath),
          //         fit: BoxFit.cover,
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           offset: const Offset(0, 1),
          //           blurRadius: 26,
          //           color: Colors.black.withOpacity(0.08),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            height: 438,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(assetPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 26,
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
          ),

          ///For shadow at bottom image
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 200,
          //     width: double.infinity,
          //     decoration:const BoxDecoration(
          //       borderRadius: BorderRadius.vertical(
          //         bottom: Radius.circular(14),
          //       ),
          //       // gradient: LinearGradient(
          //       //   begin: Alignment.topCenter,
          //       //   end: Alignment.bottomCenter,
          //       //   colors: <Color>[
          //       //     Colors.black12.withOpacity(0),
          //       //     Colors.black12.withOpacity(.4),
          //       //     Colors.black12.withOpacity(.82),
          //       //   ],
          //       // ),
          //     ),
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         name,
          //         style: theme.textTheme.headline6!.copyWith(
          //           color: Colors.white,
          //         ),
          //       ),
          //       const SizedBox(height: BottomButtonsRow.height)
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}