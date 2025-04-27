import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets_constants.dart';

class SplashSlidingLogoWidget extends StatelessWidget {
  const SplashSlidingLogoWidget({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Row(
              //no need for responsive sizes in logo
              spacing: 13,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(AssetsConstants.splashLogoIcon),
                Center(
                  child: const Text(
                    'Bookz',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          );
        });
  }
}