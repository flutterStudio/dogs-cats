import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColors {
  static const Color darkGrey = Color(0xFF212121);
  static const Color orange = Color(0xFFDD2C00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFFACE7E7);
  static const Color lighGreen = Color(0xFFCBF6F6);
  static const Color darkGreen = Color(0xFF1D4949);
  static const Color grey = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFFFFFFF);

  static const CustomColorScheme darkColorScheme = CustomColorScheme(
    primary: darkGrey,
    brightness: Brightness.dark,
    primaryVariant: darkGrey,
    secondaryVariant: orange,
    secondary: orange,
    background: darkGrey,
    error: orange,
    onBackground: white,
    onError: white,
    onPrimary: white,
    onSecondary: white,
    surface: darkGrey,
    onSurface: white,
    icon: white,
    activeIcon: white,
    inactiveIcon: white,
  );

  static const CustomColorScheme lightColorScheme = CustomColorScheme(
    primary: green,
    brightness: Brightness.light,
    primaryVariant: darkGreen,
    secondaryVariant: darkGreen,
    secondary: lighGreen,
    background: green,
    error: darkGreen,
    onBackground: darkGreen,
    onError: darkGreen,
    onPrimary: darkGreen,
    onSecondary: darkGreen,
    surface: darkGreen,
    onSurface: darkGreen,
    icon: green,
    activeIcon: darkGreen,
    inactiveIcon: white,
  );
}

class CustomColorScheme extends ColorScheme {
  final Color? icon;
  final Color? activeIcon;
  final Color? inactiveIcon;
  const CustomColorScheme(
      {required Color primary,
      required Brightness brightness,
      required Color primaryVariant,
      required Color secondaryVariant,
      required Color secondary,
      required Color background,
      required Color error,
      required Color onBackground,
      required Color onError,
      required Color onPrimary,
      required Color onSecondary,
      required Color surface,
      required Color onSurface,
      this.activeIcon,
      this.icon,
      this.inactiveIcon})
      : super(
          primary: primary,
          brightness: brightness,
          primaryVariant: primaryVariant,
          secondaryVariant: secondaryVariant,
          secondary: secondary,
          background: background,
          error: error,
          onBackground: onBackground,
          onError: onError,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          surface: surface,
          onSurface: onSurface,
        );
}
