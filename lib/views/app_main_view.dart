import 'package:OldWebApp/helpers/provider/drawer_provider.dart';
import 'package:OldWebApp/widgets/app_arrow_button.dart';
import 'package:OldWebApp/views/sections/app_page_body.dart';
import 'package:OldWebApp/views/sections/app_route_bar.dart';
import 'package:OldWebApp/views/sections/app_route_bar_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Main app view that holds an AppBar and a body widget that changes
// itself according to the current state of AppPageBloc.
class AppMainView extends StatelessWidget {
  const AppMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppRouteBar(
            drawerProvider: drawerProvider
        ),
      ),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          const AppPageBody(),
          AppArrowButton(),
        ],
      ),
      endDrawer: AppRouteBarDrawer(theme: theme),
    );
  }

}


