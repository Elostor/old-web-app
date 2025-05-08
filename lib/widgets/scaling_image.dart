import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/styles.dart';
import '../helpers/animated_scale.dart' as animated;
import '../utilities/responsive.dart';

// Just an image widget.
class ScalingImage extends StatelessWidget {
  final Offset offset;
  final String imagePath;
  final double height;
  final bool scaleOnHover;
  final double scaleWeight;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  ScalingImage(
      this.imagePath,
      this.offset,
      {Key? key,
        required this.height,
        this.scaleOnHover = true,
        this.scaleWeight = 1.05,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (_, bool isMouseOver, __) {
        double scale = isMouseOver ? scaleWeight : 1;
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          height: height,
          child: animated.AnimatedScale(
            begin: 1,
            end: scale,
            duration: Times.fast,
            curve: Curves.easeOut,
            child: MouseRegion(
              onEnter: (_) => _isMouseOverNotifier.value = true && scaleOnHover,
              onExit: (_) => _isMouseOverNotifier.value = false,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/images/home_page/$imagePath",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// A container with an image and some text.
class ScalingImageV2 extends StatelessWidget {
  final Offset offset;
  final String imagePath;
  final double height;
  final double? width;
  final double? imageWidth;
  final double? headlineSize;
  final double? textSize;
  final bool scaleOnHover;
  final double scaleWeight;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);
  final int stageNumber;
  final String givenHeadline;
  final String? givenText;

  ScalingImageV2(
      this.imagePath,
      this.offset,
      {Key? key,
        required this.height,
        this.width,
        this.imageWidth,
        this.headlineSize,
        this.textSize,
        this.scaleOnHover = true,
        this.scaleWeight = 1.2,
        required this.stageNumber,
        required this.givenHeadline,
        this.givenText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (_, bool isMouseOver, __) {
        double scale = isMouseOver ? scaleWeight : 1;
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          height: height,
          child: animated.AnimatedScale(
            begin: 1,
            end: scale,
            duration: Times.fast,
            curve: Curves.easeOut,
            child: MouseRegion(
              onEnter: (_) => _isMouseOverNotifier.value = true && scaleOnHover,
              onExit: (_) => _isMouseOverNotifier.value = false,
              child: Container(
                width: width ?? (Responsive.isDesktopWidth(context) ? 380 : 315),
                margin: const EdgeInsets.only(top: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.shadow,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Positioned(
                      width: imageWidth ?? (Responsive.isDesktopWidth(context) ? 290 : 245),
                      top: 35,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Image.asset(
                          "assets/images/home_page/$imagePath",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      width: Responsive.isDesktopWidth(context) ? 40 : 20,
                      height: Responsive.isDesktopWidth(context) ? 40 : 20,
                      top: 36,
                      left: 44,
                      child: Text(
                        '$stageNumber',
                        style: TextStyle(
                          color: theme.colorScheme.surface,
                          fontSize: 20,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w800,
                          fontFeatures: const [FontFeature.proportionalFigures()],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Text(
                            givenHeadline,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Onest',
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.secondary,
                              fontSize: headlineSize ?? (Responsive.isDesktopWidth(context) ? 17 : 15),
                              fontFeatures: const [FontFeature.proportionalFigures()],
                            ),
                          ),
                        ),
                        if (givenText != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48),
                            child: Text(
                              givenText!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Onest',
                                fontWeight: FontWeight.w400,
                                color: theme.colorScheme.background,
                                fontSize: textSize ?? 14,
                                fontFeatures: const [FontFeature.proportionalFigures()],
                              ),
                            ),
                          ),
                        SizedBox(
                          height: Responsive.isDesktopWidth(context) ? 45 : 31,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}