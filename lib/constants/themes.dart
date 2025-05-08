import 'package:MaydaNozzle/constants/colors.dart';
import 'package:flutter/material.dart';

enum ThemeType {
  darkGreen,
}

/// AppTheme is the primary means of styling colors in your application.
class AppTheme {
  static ThemeType defaultTheme = ThemeType.darkGreen;

  final ThemeType type;
  final bool isDark;
  final Color bg1;
  final Color surface1;
  final Color surface2;
  final Color accent1;
  final Color accent2;
  final Color greyWeak;
  final Color grey;
  final Color greyMedium;
  final Color greyStrong;
  final Color focus;
  final Color error;

  /// Darkness adjusted text color. Will be Black in light mode, and White in dark
  late Color mainTextColor;
  late Color inverseTextColor;

  /// Default constructor
  AppTheme(
      {required this.type,
        required this.bg1,
        required this.surface1,
        required this.surface2,
        required this.accent1,
        required this.accent2,
        required this.greyWeak,
        required this.grey,
        required this.greyMedium,
        required this.greyStrong,
        required this.focus,
        required this.error,
        required this.isDark
      }) {
    mainTextColor = isDark ? Colors.white : Colors.black;
    inverseTextColor = isDark ? Colors.black : Colors.white;
  }

  /// Creates an AppTheme from a provided Type.
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.darkGreen:
        return AppTheme(
          isDark: true,
          type: t,
          bg1: whiteSmoothBoth,
          surface1: darkGreenDark,
          surface2: lightGreenDark,
          accent1: orangeDark,
          accent2: pinkColor,
          greyWeak: whiteToGreyBoth,
          grey: greyBoth,
          greyMedium: mediumGreen,
          greyStrong: darkGreenShadow,
          focus: mediumYellow,
          error: redDark,
        );
      default:
        return AppTheme.fromType(defaultTheme);
    }
  }

  // Converts AppTheme into a Material Theme Data, using whatever mappings we like
  ThemeData toThemeData() {
    var t = ThemeData.from(
      // Use the .dark() and .light() constructors to handle the text themes
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      // Use ColorScheme to generate the bulk of the color theme
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryContainer: shift(accent1, .1),
        secondary: accent2,
        secondaryContainer: shift(accent2, .1),
        tertiary: greyMedium,
        background: bg1,
        surface: surface1,
        surfaceVariant: surface2,
        outline: focus,
        onBackground: mainTextColor,
        onSurface: mainTextColor,
        onError: mainTextColor,
        onPrimary: inverseTextColor,
        onSecondary: inverseTextColor,
        error: error,
        shadow: greyStrong,
      ),
    );

    // Apply additional styling that is missed by ColorScheme
    t.copyWith(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: surface1,
          selectionHandleColor: Colors.transparent,
          selectionColor: surface1,
        ),
        highlightColor: shift(accent1, .1),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return accent1;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return accent1;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return accent1;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return accent1;
            }
            return null;
          }),
        )
    );

    // All done, return the ThemeData
    return t;
  }

  /// This will add luminance in dark mode, and remove it in light.
  // Allows the view to just make something "stronger" or "weaker" without worrying what the current theme brightness is
  //      color = theme.shift(someColor, .1); //-10% lum in dark mode, +10% in light mode
  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslColor = HSLColor.fromColor(c); // Convert to HSL
    double lightness = (hslColor.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslColor.withLightness(lightness).toColor(); // Convert back to Color
  }
}