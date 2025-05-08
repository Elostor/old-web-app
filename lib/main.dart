import 'package:MaydaNozzle/constants/themes.dart';
import 'package:MaydaNozzle/helpers/loading/loading_screen.dart';
import 'package:MaydaNozzle/helpers/provider/drawer_provider.dart';
import 'package:MaydaNozzle/helpers/provider/scroll_provider.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_bloc.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_event.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_state.dart';
import 'package:MaydaNozzle/services/bloc/connection/connection_bloc.dart';
import 'package:MaydaNozzle/services/bloc/connection/connection_state.dart';
import 'package:MaydaNozzle/services/bloc/simple_bloc_observer.dart';
import 'package:MaydaNozzle/services/router/app_router_delagate.dart';
import 'package:MaydaNozzle/services/router/app_router_parser.dart';
import 'package:MaydaNozzle/utilities/cubit/theme_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory()
  );
  usePathUrlStrategy();
  Bloc.observer = SimpleBlocObserver();

  runApp(AppWrapper());
}

class AppWrapper extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<AppPageBloc>(
            create: (context) => AppPageBloc(),
          ),
          BlocProvider<ConnectionBloc>(
            create: (context) => ConnectionBloc(),
          ),
        ],
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => ScrollProvider(),
              ),
              ChangeNotifierProvider(
                  create: (context) => DrawerProvider(),
              ),
            ],
            child: Sizer(builder: (context, orientation, deviceType) {
              return BlocBuilder<ThemeCubit, ThemeType>(
                builder: (context, themeType) {
                  return BlocConsumer<ConnectionBloc, ConnectionBlocState>(
                    listener: (context, state) {
                     if (state.isLoading) {
                       LoadingScreen().show(
                           context: context,
                           text: 'Please wait a moment.'
                       );
                     } else {
                       LoadingScreen().hide();
                     }
                    },
                    builder: (context, state) {
                      context.read<AppPageBloc>().add(const AppPageInitializeApp());

                      return BlocConsumer<AppPageBloc, AppPageState>(
                        listener: (context, state) {
                          // TODO: implement a loading screen for app pages.
                        },
                        builder: (context, state) {
                          return MaterialApp.router(
                            theme: AppTheme.fromType(themeType).toThemeData(),
                            title: 'MaydaNozzle',
                            routerDelegate: AppRouterDelegate(
                              navigatorKey,
                              context.read<AppPageBloc>(),
                            ),
                            routeInformationParser: AppRouterParser(
                                appPageBloc: context.read<AppPageBloc>()
                            ),
                            backButtonDispatcher: RootBackButtonDispatcher(),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },)
        )
    );
  }
}




