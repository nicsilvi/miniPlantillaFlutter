import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class AppTheme {
  static ThemeData getTheme(bool isDarkMode) =>
      isDarkMode ? darkTheme : lightTheme;

  // Light theme  ---------------------------------------------------------------------------------------------
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.lightBg),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.lightBg),
    scaffoldBackgroundColor: AppColors.lightBg,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.light),
      backgroundColor: AppColors.lightBg,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.lightSec,
        fontSize: 26,
      ),
    ),
  );

  // darktheme  ---------------------------------------------------------------------------------------------
  static final ThemeData darkTheme = ThemeData.light().copyWith(
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.lightBg),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.lightBg),
    scaffoldBackgroundColor: AppColors.lightBg,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.light),
      backgroundColor: AppColors.lightBg,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.lightSec,
        fontSize: 26,
      ),
    ),
  );
}
