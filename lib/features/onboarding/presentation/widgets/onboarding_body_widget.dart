import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/constants/colors_constants.dart';
import '../../../../core/ui_helpers/custom_shared_widgets/custom_button_widget.dart';
import '../../../../router/routes_constants.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 1.sw, child: Image.asset(AssetsConstants.onboardingImage)),
              SizedBox(height: 30.h),
              Text('Books List', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              SizedBox(height: 10.h),
              SizedBox(
                width: 200.w,
                child: Text(
                  'Let\'s read some books and have fun',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsConstants.kTextColor2),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        CustomButtonWidget(buttonText: 'Get Started', onTap: () => context.pushReplacement(RoutesConstants.homeScreenRoute)),
      ],
    );
  }
}
