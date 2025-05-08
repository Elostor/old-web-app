import 'package:OldWebApp/services/bloc/app_page/app_page_bloc.dart';
import 'package:OldWebApp/services/bloc/app_page/app_page_event.dart';
import 'package:OldWebApp/services/bloc/app_page/app_page_state.dart';
import 'package:OldWebApp/views/app_main_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppPageState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AppPageBloc _appPageBloc;

  AppRouterDelegate(
      GlobalKey<NavigatorState> navigatorKey,
      AppPageBloc appPageBloc
      ) : _navigatorKey = navigatorKey, _appPageBloc = appPageBloc;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  AppPageBloc get appPageBloc => _appPageBloc;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [
        MaterialPage(
            key: ValueKey('mainView'),
            child: AppMainView(),
        ),
      ],
      onPopPage: onPopPage,
    );
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    } else {
      popRoute();
      return true;
    }
  }

  @override
  Future<bool> popRoute() async {
    if (appPageBloc.state is! HomePage) {
      appPageBloc.add(const AppPageInitializeHome());
      return true;
    }
    // Not sure about this one ?
    if (kIsWeb) {
      Navigator.pop(navigatorKey.currentContext!);
      return false;
    }

    return _confirmAppExit();
  }

  @override
  Future<void> setNewRoutePath(AppPageState configuration) async {
    appPageBloc.setNewRoutePath(configuration);
  }

  // App exit pop-up. It can be placed elsewhere maybe?
  Future<bool> _confirmAppExit() async {
    return await showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text('Uygulamayı Kapat'),
          content: const Text('Uygulamayı kapatmak istediğinize emin misiniz?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Devam Et'),
            )
          ],
        );},) ?? true;
  }

  // These two aren't required since the app is using Bloc to notify listeners.
  @override
  void addListener(VoidCallback listener) {}
  @override
  void removeListener(VoidCallback listener) {}
}