import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets_constants.dart';
import '../../constants/colors_constants.dart';

class CustomSearchBarWidget extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function(PointerDownEvent) onTapOutside;
  final bool hasFilterIcon;
  final SearchController controller;
  final bool autoFocus;
  final bool isEnabled;
  const CustomSearchBarWidget({
    required this.hintText,
    required this.onTap,
    required this.onChanged,
    required this.onSubmitted,
    required this.onTapOutside,
    this.hasFilterIcon = true,
    required this.controller,
    this.autoFocus = false,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        Flexible(
          child: SearchBar(
            enabled: isEnabled,

            controller: controller,
            autoFocus: autoFocus,
            leading: SvgPicture.asset(AssetsConstants.searchIcon),
            hintText: hintText,
            hintStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: ColorsConstants.kTertiaryColor1)),
            onTap: onTap,
            elevation: WidgetStatePropertyAll(10),
            onChanged: onChanged,
            onTapOutside: onTapOutside,
            onSubmitted: onSubmitted,
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            //constraints: BoxConstraints(minHeight: 60.h),
          ),
        ),
        if(hasFilterIcon) SvgPicture.asset(AssetsConstants.filterIcon),
      ],
    );
  }
}
