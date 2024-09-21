import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/core/constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  listTileTheme: ListTileThemeData(
    titleTextStyle: GoogleFonts.rubik(fontSize: 22.sp, color: AppColors.titleColor),
  ),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.rubik(
      fontSize: 18.sp,
      color: AppColors.titleColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.rubik(
      color: AppColors.activeNavBtn,
    ),
  ),
  scaffoldBackgroundColor: AppColors.mainBg,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.activeNavBtn,
    unselectedItemColor: AppColors.inactiveNavBtn,
    selectedIconTheme: IconThemeData(size: 25.sp),
    unselectedIconTheme: IconThemeData(size: 25.sp),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      enableFeedback: false,
      textStyle: GoogleFonts.rubik(
        fontSize: 13.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
);
