import 'package:flutter/material.dart';

class AnimatedFadeInOut extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double? begin;
  final double? end;

  const AnimatedFadeInOut({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.begin,
    this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(
          begin: begin ?? 0,
          end: end ?? 1,
        ),
        duration: duration,
        child: child,
        builder: (context, value, builderChild) {
          return Opacity(
            opacity: value,
            child: builderChild,
          );
        },
    );
  }
}
