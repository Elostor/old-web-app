import 'dart:ui';
import 'package:MaydaNozzle/constants/icons.dart';
import 'package:MaydaNozzle/constants/turkish_lang.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_bloc.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouteBarDrawer extends StatelessWidget {
  final ThemeData theme;

  const AppRouteBarDrawer({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          color: theme.colorScheme.surface,
          child: Column(
            children: [
              const ListTile(  // TODO change this with MaydaNozzle values.
                leading: FlutterLogo(size: 30),
                title: Text(
                  'Flutter',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFeatures: [FontFeature.proportionalFigures()],
                  ),
                ),
              ),
              Divider(
                color: theme.colorScheme.shadow,
                height: 16,
              ),
              drawerIconButton(
                text: home,
                icon: homeIcon,
                theme: theme,
                givenEvent: const AppPageInitializeHome(),
                context: context,
              ),
              const SizedBox(height: 16),
              drawerIconButton(
                text: myCart,
                icon: cartIcon,
                theme: theme,
                givenEvent: const AppPageInitializeMyCart(),
                context: context,
              ),
              const SizedBox(height: 16),
              drawerIconButton(
                text: upload,
                icon: uploadIcon,
                theme: theme,
                givenEvent: const AppPageInitializeUpload(),
                context: context,
              ),
              const SizedBox(height: 16),
              drawerIconButton(
                text: help,
                icon: helpIcon,
                theme: theme,
                givenEvent: const AppPageInitializeHelp(),
                context: context,
              ),
              const SizedBox(height: 16),
              drawerIconButton(
                text: myModels,
                icon: cubeIcon,
                theme: theme,
                givenEvent: const AppPageInitializeMyModels(),
                context: context,
              ),
              Divider(
                color: theme.colorScheme.shadow, height: 16,
              ),
              drawerTextButton(
                  text: materials,
                  theme: theme,
                  context: context,
                  givenEvent: const AppPageInitializeMaterials(),
              ),
              const Spacer(),
              drawerUserFooter(
                image: 'assets/images/user_pic_placeholder.jpg',
                name: 'Anonim',
                email: 'anonim@anonim.com',
                onClicked: () {},
                theme: theme,
              )
            ],
          ),
        ),
      );
  }
}

// User Tile that shows a profile picture and some basic info about the user.
Widget drawerUserFooter({
  required String image,
  required String name,
  required String email,
  required VoidCallback onClicked,
  required ThemeData theme,
}) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Row(
        children: [
          const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80')
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 14,
                  fontFeatures: [FontFeature.proportionalFigures()],
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.error,
            child: Icon(
                signOutIcon,
                color: theme.colorScheme.background
            ),

          )
        ],
      ),
    ),

  );
}

// An icon button made of ListTile widget.
Widget drawerIconButton({
  required String text,
  required IconData icon,
  required ThemeData theme,
  required BuildContext context,
  AppPageEvent? givenEvent,
  VoidCallback? givenFunction,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: theme.colorScheme.background,
      size: 25,
    ),
    title: Text(
      text,
      style: TextStyle(
        color: theme.colorScheme.background,
        fontFamily: 'Onest',
        fontWeight: FontWeight.w300,
        fontSize: 14,
        fontFeatures: const [FontFeature.proportionalFigures()],
      ),
    ),
    hoverColor: theme.colorScheme.secondary,
    onTap: (givenEvent != null) ? () {
      context.read<AppPageBloc>().add(givenEvent);
    } : givenFunction,
  );
}

// An icon button made of ListTile widget.
Widget drawerTextButton({
  required String text,
  AppPageEvent? givenEvent,
  required ThemeData theme,
  required BuildContext context,
  VoidCallback? givenFunction,
}) {
  return ListTile(
    leading: Text(
      text,
      style: TextStyle(
        color: theme.colorScheme.background,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFeatures: const [FontFeature.proportionalFigures()],
      ),
    ),
    hoverColor: theme.colorScheme.secondary,
    onTap: (givenEvent != null) ? () {
      context.read<AppPageBloc>().add(givenEvent);
    } : givenFunction,
  );
}


