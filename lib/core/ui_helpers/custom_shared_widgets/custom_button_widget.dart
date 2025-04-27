import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors_constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const CustomButtonWidget({required this.onTap, required this.buttonText, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        height: 68.h,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 37.h),
        decoration: BoxDecoration(color: ColorsConstants.kPrimaryColor1, borderRadius: BorderRadius.circular(15), shape: BoxShape.rectangle),
        child: Center(child: Text(buttonText, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
