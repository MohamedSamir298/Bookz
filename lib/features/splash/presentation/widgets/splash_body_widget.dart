import 'package:bookz_app/features/splash/presentation/widgets/splash_sliding_logo_widget.dart';
import 'package:bookz_app/router/routes_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui_helpers/custom_shared_widgets/custom_progress_indicator_widget.dart';

class SplashBodyWidget extends StatefulWidget {
  const SplashBodyWidget({super.key});

  @override
  State<SplashBodyWidget> createState() => _SplashBodyWidgetState();
}

class _SplashBodyWidgetState extends State<SplashBodyWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SplashSlidingLogoWidget(slidingAnimation: slidingAnimation),
        if (showLoading) CustomProgressIndicatorWidget(width: 100.w, padding: EdgeInsets.only(bottom: 30.h)),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset(0, 0)).animate(animationController);

    animationController.forward().then((_) {
      setState(() {
        showLoading = true;
      });
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.pushReplacement(RoutesConstants.onboardingScreenRoute);
      }
    });
  }
}
