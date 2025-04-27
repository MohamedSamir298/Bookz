import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors_constants.dart';

class AppTheme {
  static ThemeData darkTheme (){
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorsConstants.kSecondaryColor1,
      textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme:  AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
        centerTitle: true,
      )
    );
  }
}