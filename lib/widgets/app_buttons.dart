import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/bloc/app_page/app_page_bloc.dart';
import '../services/bloc/app_page/app_page_event.dart';
import '../utilities/responsive.dart';

// A button which comes with an icon and a text.
class AppRouteBarIconTextButton extends StatelessWidget {
  final AppPageEvent? givenEvent;
  final VoidCallback? givenFunction;
  final String? givenText;
  final IconData givenIcon;
  final double? givenSize;
  final double? givenSizedBoxSize;
  final ThemeData currentTheme;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  AppRouteBarIconTextButton({
    Key? key,
    this.givenEvent,
    this.givenFunction,
    this.givenText,
    required this.givenIcon,
    this.givenSize,
    this.givenSizedBoxSize,
    required this.currentTheme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (context, bool isMouseOver, child) {
        Color color = isMouseOver ? currentTheme.colorScheme.secondary
            : currentTheme.colorScheme.background;

        return InkWell(
          highlightColor: Colors.transparent,
          onHover: (value) => _isMouseOverNotifier.value = value,
          onTap: (givenEvent != null) ? () {
            context.read<AppPageBloc>().add(givenEvent!);
          } : givenFunction,
          child: Padding(
            padding: EdgeInsets.only(
                top: Responsive.isDesktopWidth(context) ? 10 : 20,
                right: 15
            ),
            child: SizedBox(
              height: 70,
              width: 75,
              child: Column(
                children: [
                  Icon(
                    givenIcon,
                    color: color,
                    size: givenSize ?? 25,
                  ),
                  if (givenText != null) ...[
                    SizedBox(height: givenSizedBoxSize ?? 2),
                    Text(
                      givenText!,
                      style: TextStyle(
                        color: color,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFeatures: const [FontFeature.proportionalFigures()],
                      ),)
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
class AppRouteBarIconTextButtonHorizontal extends StatelessWidget {
  final AppPageEvent? givenEvent;
  final Function? givenFunction;
  final String? givenText;
  final IconData givenIcon;
  final double? givenSize;
  final double? givenSizedBoxSize;
  final ThemeData currentTheme;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  AppRouteBarIconTextButtonHorizontal({
    Key? key,
    this.givenEvent,
    this.givenFunction,
    this.givenText,
    required this.givenIcon,
    this.givenSize,
    this.givenSizedBoxSize,
    required this.currentTheme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (context, bool isMouseOver, child) {
        Color color = isMouseOver ? currentTheme.colorScheme.secondary
            : currentTheme.colorScheme.background;

        return InkWell(
          highlightColor: Colors.transparent,
          onHover: (value) => _isMouseOverNotifier.value = value,
          onTap: (givenEvent != null) ? () {
            context.read<AppPageBloc>().add(givenEvent!);
          } : givenFunction!(),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 45,
              width: 100,
              child: Row(
                children: [
                  if (givenText != null) ...[
                    Text(
                      givenText!,
                      style: TextStyle(
                        color: color,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFeatures: const [FontFeature.proportionalFigures()],
                      ),
                    ),
                    SizedBox(width: givenSizedBoxSize ?? 2),
                  ],
                  Icon(
                    givenIcon,
                    color: color,
                    size: givenSize ?? 25,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// A button which comes with just an icon.
class AppRouteBarIconButtonV1 extends StatelessWidget {
  final VoidCallback? givenFunction;
  final AppPageEvent? givenEvent;
  final IconData givenIcon;
  final double? givenSize;
  final double? givenTopPaddingSize;
  final double? givenRightPaddingSize;
  final double? givenLeftPaddingSize;
  final ThemeData currentTheme;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  AppRouteBarIconButtonV1({
    Key? key,
    this.givenFunction,
    this.givenEvent,
    required this.givenIcon,
    this.givenSize,
    this.givenTopPaddingSize,
    this.givenRightPaddingSize,
    this.givenLeftPaddingSize,
    required this.currentTheme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (context, bool isMouseOver, child) {
        Color color = isMouseOver ? currentTheme.colorScheme.secondary
            : currentTheme.colorScheme.background;

        return InkWell(
          highlightColor: Colors.transparent,
          onHover: (value) => _isMouseOverNotifier.value = value,
          onTap: (givenEvent != null) ? () {
            context.read<AppPageBloc>().add(givenEvent!);
          } : givenFunction,
          child: Padding(
            padding: EdgeInsets.only(
              top: Responsive.isDesktopWidth(context) ? givenTopPaddingSize ?? 22
                    : givenTopPaddingSize ?? 32,
              right: givenRightPaddingSize ?? 8,
              left: givenLeftPaddingSize ?? 0,
            ),
            child: SizedBox(
              height: 55,
              width: 55,
              child: Column(
                children: [
                  Icon(
                    givenIcon,
                    color: color,
                    size: givenSize ?? 22,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// A button which comes with just a text.
class AppRouteBarTextButtonV1 extends StatelessWidget {
  final AppPageEvent givenEvent;
  final String givenText;
  final double? givenSize;
  final ThemeData currentTheme;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  AppRouteBarTextButtonV1({
    Key? key,
    required this.givenEvent,
    required this.givenText,
    this.givenSize,
    required this.currentTheme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (context, bool isMouseOver, child) {
        Color color = isMouseOver ? currentTheme.colorScheme.secondary
            : currentTheme.colorScheme.background;

        return InkWell(
          highlightColor: Colors.transparent,
          onHover: (value) => _isMouseOverNotifier.value = value,
          onTap: () {
            context.read<AppPageBloc>().add(givenEvent);
          },
          child: Padding(
            padding: EdgeInsets.only(top: Responsive.isDesktopWidth(context) ? 22 : 32, left: 25),
            child: SizedBox(
              height: 70,
              width: 95,
              child: Column(
                children: [
                  Text(
                    givenText,
                    style: TextStyle(
                      color: color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: givenSize ?? 16,
                      fontFeatures: const [FontFeature.proportionalFigures()],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// A button with background decoration.
class AppRouteBarFullButton extends StatelessWidget {
  final AppPageEvent givenEvent;
  final String givenText;
  final ThemeData currentTheme;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);
  final double? givenEdgeRadius;
  final double? givenVerticalInset;
  final double? givenHorizontalInset;
  final double? givenTextSize;
  final FontWeight? fontWeight;
  final double? givenLetterSpacing;

  AppRouteBarFullButton({
    Key? key,
    required this.givenEvent,
    required this.givenText,
    required this.currentTheme,
    this.givenEdgeRadius,
    this.givenVerticalInset,
    this.givenHorizontalInset,
    this.givenTextSize,
    this.fontWeight,
    this.givenLetterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isMouseOverNotifier,
        builder: (context, bool isMouseOver, child) {
          Color color = isMouseOver ? currentTheme.colorScheme.surfaceVariant
              : currentTheme.colorScheme.primary;

          return InkWell(
            onHover: (value) {
              _isMouseOverNotifier.value = value;
            },
            onTap: () => context.read<AppPageBloc>().add(givenEvent),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 140),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(givenEdgeRadius ?? 8),
                color: color,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: givenVerticalInset ?? 10,
                  horizontal: givenHorizontalInset ?? 20
              ),
              child: Text(
                givenText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentTheme.colorScheme.background,
                  fontSize: givenTextSize ?? 15,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  letterSpacing: givenLetterSpacing ?? 0,
                  fontFamily: 'Poppins',
                  fontFeatures: const [FontFeature.proportionalFigures()],
                ),
              ),
            ),
          );
        }
    );
  }
}