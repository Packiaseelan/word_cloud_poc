import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFFFFFFFF);
  static const secondaryColor = Color(0xFF777778);
  static const tertiaryColor = Color(0xFF3DB8FC);
  static const quaternaryColor = Color(0xFFEB6842);
  static const quinaryColor = Color(0xFF77ADD9);
  static const senaryColor = Color(0xFF8D62F7);
  static const septenaryColor = Color(0xFFFB9857);
  static const octonaryColor = Color(0xFFCC5FFB);
  static const nonaryColor = Color(0xFFC1FC00);
  static const darkGray = Color(0xFF979797);
  static const grey = Color(0xFFACACAC);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFDB3022);
  static const lightGray = Color(0xFF9B9B9B);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFF1C1C1E);
  static const backgroundLight = Color(0xFF2C2C2E);
  static const backgroundLighter = Color(0xFF3A3A3B);
  static const black = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const disable = Color(0xFF929794);
  static const cardBgColor = Color(0xFFF8F8F8);
  static const progressBgColor = Color(0xFF49494B);
  static const blue = Color(0xFF4451F0);

  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      ),
      primaryColor: primaryColor,
      primaryColorLight: lightGray,
      bottomAppBarColor: lightGray,
      backgroundColor: background,
      scaffoldBackgroundColor: background,
      errorColor: red,
      dividerColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          color: background,
          titleTextStyle: TextStyle(
            fontFamily: 'Urbanist',
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
      ),
      textTheme: theme.textTheme.copyWith(
        displayLarge: theme.textTheme.displayLarge?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: theme.textTheme.displayMedium?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: theme.textTheme.displaySmall?.copyWith(
          fontFamily: 'Urbanist',
          color: secondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: theme.textTheme.headlineLarge?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: theme.textTheme.headlineMedium?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: theme.textTheme.headlineSmall?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
        ),
        titleLarge: theme.textTheme.titleLarge?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: theme.textTheme.titleMedium?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: theme.textTheme.titleSmall?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: theme.textTheme.bodyLarge?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
        ),
        bodyMedium: theme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
        ),
        bodySmall: theme.textTheme.bodySmall?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        labelLarge: theme.textTheme.labelLarge?.copyWith(
          fontFamily: 'Urbanist',
          color: primaryColor,
        ),
        labelMedium: theme.textTheme.labelMedium?.copyWith(
          fontFamily: 'Urbanist',
          color: secondaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: theme.textTheme.labelSmall?.copyWith(
          fontFamily: 'Urbanist',
          color: secondaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        )
      ),
    );
  }
}
