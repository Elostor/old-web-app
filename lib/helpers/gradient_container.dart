import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final List<Color> colors;
  final List<double> stops;
  final Alignment? begin;
  final Alignment? end;
  final Alignment? alignment;

  const GradientContainer({
    required this.colors,
    required this.stops,
    Key? key,
    this.child,
    this.width,
    this.height,
    this.alignment,
    this.begin,
    this.end
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin ?? Alignment.centerLeft,
          end: end ?? Alignment.centerRight,
          colors: colors,
          stops: stops,
        ),
      ),
      child: child,
    ),
  );
}

class HzGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  final Widget? child;
  final double? width;
  final double? height;
  final Alignment? alignment;

  const HzGradient({
    required this.colors,
    required this.stops,
    Key? key,
    this.child,
    this.width,
    this.height,
    this.alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      GradientContainer(
          colors: colors,
          stops :stops,
          width: width,
          height: height,
          alignment: alignment,
          child: child
      );
}

class VtGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final Widget? child;

  const VtGradient(
      this.colors,
      this.stops,
      {Key? key,
        this.child,
        this.width,
        this.height,
        this.alignment
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => GradientContainer(
      colors: colors,
      stops: stops,
      width: width,
      height: height,
      alignment: alignment,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      child: child
  );
}