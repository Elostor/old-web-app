import 'package:MaydaNozzle/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

// Checks screen size then returns a widget according to it.
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop
  }) : super(key: key);

  // returns a platform bool value which is purely based on screen width
  static bool isMobileWidth(BuildContext context) =>
      context.widthPx < mobileMaxWidth;
  static bool isTabletWidth(BuildContext context) =>
      context.widthPx < desktopMinWidth && context.widthPx >= mobileMaxWidth;
  static bool isDesktopWidth(BuildContext context) =>
      context.widthPx >= desktopMinWidth;

  @override
  Widget build(BuildContext context) {
    if(context.widthPx >= desktopMinWidth) {
      return desktop;
    } else if (mobileMaxWidth <= context.widthPx) {
      return tablet;
    } else {
      return mobile;
    }
  }
}