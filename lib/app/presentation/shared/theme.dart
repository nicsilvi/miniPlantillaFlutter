import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class AppTheme {
  static ThemeData getTheme(bool isDarkMode) =>
      isDarkMode ? darkTheme : lightTheme;

  // Light theme  ---------------------------------------------------------------------------------------------
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //al ser copywith solo se modifica lo especificado aqui
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.lightBg),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.lightBg),
    scaffoldBackgroundColor: AppColors.lightBg,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.light),
      backgroundColor: AppColors.lightBg,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.lightop,
        fontSize: 26,
      ),
    ),
  );

  // darktheme  ---------------------------------------------------------------------------------------------
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: const AppBarTheme(
      color: AppColors.dark2,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 197, 191, 191)),
      titleTextStyle: TextStyle(
        color: AppColors.darkop,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 4, // Un poco de sombra para el appBar
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.dark2,
      scrimColor: Color(0x8A000000),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Color(0xFF333333)),

    // Text styles
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white70, fontSize: 16), // Texto normal
      bodyMedium:
          TextStyle(color: Colors.white54, fontSize: 14), // Texto más pequeño
      headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold), // Títulos grandes
      headlineMedium: TextStyle(
          color: Colors.white70,
          fontSize: 28,
          fontWeight: FontWeight.w500), // Subtítulos
    ),
    iconTheme: const IconThemeData(color: Colors.white), // Íconos blancos
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF6200EE),
    ),
    // Ajuste del color de los elementos deseleccionados (como Checkboxes, etc)
    unselectedWidgetColor: Colors.white70,
  );
}
