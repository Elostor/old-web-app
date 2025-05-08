import 'package:MaydaNozzle/constants/colors.dart';
import 'package:MaydaNozzle/constants/icons.dart';
import 'package:MaydaNozzle/constants/turkish_lang.dart';
import 'package:MaydaNozzle/helpers/provider/drawer_provider.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_bloc.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sized_context/sized_context.dart';
import '../../utilities/responsive.dart';
import '../../widgets/app_buttons.dart';

class AppRouteBar extends StatefulWidget {
  final DrawerProvider drawerProvider;

  const AppRouteBar({
    Key? key,
    required this.drawerProvider,
  }) : super(key: key);

  @override
  State<AppRouteBar> createState() => _AppRouteBarState();
}

class _AppRouteBarState extends State<AppRouteBar> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return AnimatedContainer(
      height: Responsive.isDesktopWidth(context) ? 75
          : 90,
      width: context.widthPx,
      color: darkGreenDark,
      padding: EdgeInsets.symmetric(horizontal: Responsive.isDesktopWidth(context) ? 30 : 20, vertical: 5),
      duration: const Duration(milliseconds: 100),
      child: Row(
        children: [
          const _AppRouteBarLogo(),
          const SizedBox(width: 30,),
          if (Responsive.isDesktopWidth(context))
            AppRouteBarTextButtonV1(
            givenEvent: const AppPageInitializeMaterials(),
            givenText: materials,
            currentTheme: theme,
            ),
          if (Responsive.isDesktopWidth(context) && context.widthPx > 1200)
            AppRouteBarTextButtonV1(
              givenEvent: const AppPageInitializeAboutUs(),
              givenText: aboutUs,
              currentTheme: theme,
            ),
          const Expanded(
              child: SizedBox()
          ),
          if (Responsive.isDesktopWidth(context))
            ...desktopWidgets(theme)
          else if (Responsive.isTabletWidth(context))
            ...tabletWidgets(theme)
          else
            ...mobileWidgets(theme)
        ]
      ),
    );
  }

  // Widgets to be seen by user when Responsive.isMobileWidth value is true.
  List<Widget> mobileWidgets(ThemeData theme) {
    return [
      AppRouteBarFullButton(
        givenEvent: const AppPageInitializeUpload(),
        givenText: letsStart,
        currentTheme: theme,
      ),
      const SizedBox(width: 20,),
      VerticalDivider(
        color: theme.colorScheme.shadow,
        width: 15,
      ),
      AppRouteBarIconButtonV1(
        givenIcon: fourLinesMenuIcon,
        currentTheme: theme,
        givenFunction: widget.drawerProvider.key.currentState!.openEndDrawer,
        givenRightPaddingSize: 0,
        givenTopPaddingSize: 28,
        givenLeftPaddingSize: 8,
        givenSize: 26,
      ),
    ];
  }

  // Widgets to be seen by user when Responsive.isTabletWidth value is true.
  List<Widget> tabletWidgets(ThemeData theme) {
    return [
      AppRouteBarFullButton(
        givenEvent: const AppPageInitializeUpload(),
        givenText: letsStart,
        currentTheme: theme,
      ),
      const SizedBox(width: 15,),
      VerticalDivider(
        color: theme.colorScheme.shadow,
        width: 15,
      ),
      AppRouteBarIconTextButton(
        givenEvent: const AppPageInitializeMyCart(),
        givenText: myCart,
        givenIcon: cartIcon,
        currentTheme: theme,
      ),
      AppRouteBarIconTextButton(
        givenEvent: const AppPageInitializeApp(), // TODO add login event here
        givenText: logIn,
        givenIcon: signInIcon,
        givenSize: 26,
        givenSizedBoxSize: 1,
        currentTheme: theme,
      ),
      AppRouteBarIconButtonV1(
        givenIcon: fourLinesMenuIcon,
        currentTheme: theme,
        givenFunction: widget.drawerProvider.key.currentState!.openEndDrawer,
        givenRightPaddingSize: 0,
        givenTopPaddingSize: 28,
        givenLeftPaddingSize: 8,
        givenSize: 26,
      ),
    ];
  }

  // Widgets to be seen by user when Responsive.isDesktopWidth value is true.
  List<Widget> desktopWidgets(ThemeData theme) {
     return [
        AppRouteBarIconTextButton(
          givenEvent: const AppPageInitializeUpload(),
          givenText: upload,
          givenIcon: uploadIcon,
          currentTheme: theme,
       ),
       AppRouteBarIconTextButton(
          givenEvent: const AppPageInitializeMyModels(),
          givenText: myModels,
          givenIcon: cubeIcon,
          currentTheme: theme,
       ),
       AppRouteBarIconTextButton(
          givenEvent: const AppPageInitializeMyCart(),
          givenText: myCart,
          givenIcon: cartIcon,
          currentTheme: theme,
       ),
       AppRouteBarIconTextButton(
          givenEvent: const AppPageInitializeApp(), // TODO add login event here
          givenText: logIn,
          givenIcon: signInIcon,
          givenSize: 26,
          givenSizedBoxSize: 1,
          currentTheme: theme,
       ),
       VerticalDivider(
         color: theme.colorScheme.shadow,
       ),
       AppRouteBarIconButtonV1(
          givenEvent: const AppPageInitializeHelp(),
          givenIcon: helpIcon,
          currentTheme: theme,
          givenSize: 22,
       ),
       AppRouteBarFullButton(
          givenEvent: const AppPageInitializeUpload(),
          givenText: letsStart,
          currentTheme: theme,
        ),
      ];
    }
  }

// MaydaNozzle logo, lies here.
class _AppRouteBarLogo extends StatefulWidget {
  const _AppRouteBarLogo({Key? key}) : super(key: key);

  @override
  State<_AppRouteBarLogo> createState() => _AppRouteBarLogoState();
}
class _AppRouteBarLogoState extends State<_AppRouteBarLogo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.isDesktopWidth(context) ? 70
          : 65,
      child: InkWell(
        child: logoImg(),
        onTap: () => context.read<AppPageBloc>().add(const AppPageInitializeHome()),
      ),
    );
  }

  Widget logoImg() {
    if (Responsive.isMobileWidth(context)) {
      return Image.asset('assets/logo/mayda-paytr-icon.png');
    } else {
      return Responsive(
        key: widget.key,
        desktop: Image.asset('assets/logo/mayda-paytr-icon-web.png'),
        tablet: Image.asset('assets/logo/mayda-paytr-icon-web.png'),
        mobile: Image.asset('assets/logo/mayda-paytr-icon.png'),
      );
    }
  }

  double logoWidth() {
    if (Responsive.isMobileWidth(context)) {
      return 180;
    } else if (Responsive.isTabletWidth(context)) {
      return 200;
    } else {
      return 275;
    }
  }
}









