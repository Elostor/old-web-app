import 'package:MaydaNozzle/constants/icons.dart';
import 'package:MaydaNozzle/helpers/animated_fade_in_out.dart';
import 'package:MaydaNozzle/helpers/provider/scroll_provider.dart';
import 'package:MaydaNozzle/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppArrowButton extends StatelessWidget {
  final ValueNotifier<bool> _shouldBeVisible = ValueNotifier(true); // TODO change this to false later
  final ValueNotifier<bool> _shouldChangeColor = ValueNotifier(false);

  AppArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return ValueListenableBuilder(
        valueListenable: _shouldBeVisible,
        builder: (context, bool becomeVisible, child) {
          return Positioned(
            bottom: 50,
            right: 20,
            child: AnimatedFadeInOut(
              begin: 0,
              end: becomeVisible ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              child: ValueListenableBuilder(
                valueListenable: _shouldChangeColor,
                builder: (context, bool changeColor, child) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onHover: (value) => _shouldChangeColor.value = value,
                    onTap: () => scrollProvider.jumpTo(0),
                    child: Material(
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: changeColor ? Theme.of(context).colorScheme.surfaceVariant
                            : Theme.of(context).colorScheme.primary,
                        radius: Responsive.isDesktopWidth(context) ? 35 : 30,
                        child: Icon(
                          arrowUpIcon,
                          color: Theme.of(context).colorScheme.surface,
                          size: Responsive.isDesktopWidth(context) ? 30 : 25,
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
          );
        },
    );
  }
}
