import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';
import '../../widgets/home_page_steps_widget.dart';

class HomePageStepsWidgetWrapper extends StatelessWidget {
  const HomePageStepsWidgetWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        ClipPath(
          clipper: _WrapperClipper(),
          child: Container(
            height: context.heightPx,
            color: theme.colorScheme.surface,
          ),
        ),
        Container(
          height: context.heightPx * 1.025,
          alignment: Alignment.center,
          child: HomePageViewStepsWidget(theme: theme),
        ),
      ],
    );
  }
}

class _WrapperClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path = Path();
    Offset midPoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, size.height - 100);

    path.lineTo(0.0, size.height - 100);
    path.quadraticBezierTo(midPoint.dx, midPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}