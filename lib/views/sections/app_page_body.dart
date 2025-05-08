import 'package:MaydaNozzle/services/bloc/app_page/app_page_bloc.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_state.dart';
import 'package:MaydaNozzle/views/sections/home_page_steps_widget_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../helpers/provider/scroll_provider.dart';

// A body widget that rearranges itself according to the current AppPageState.
// It has a scrolling function.
class AppPageBody extends StatefulWidget {
  const AppPageBody({super.key});

  @override
  State<AppPageBody> createState() => _AppPageBodyState();
}

class _AppPageBodyState extends State<AppPageBody> {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final appPageBloc = context.read<AppPageBloc>();

    return ScrollablePositionedList.builder(
      itemScrollController: scrollProvider.itemScrollController,
      itemPositionsListener: scrollProvider.itemPositionsListener,
      scrollOffsetController: scrollProvider.scrollOffsetController,
      itemCount: _pageWidgets(scrollProvider, appPageBloc)!.length,
      itemBuilder: (context, index) => _pageWidgets(scrollProvider, appPageBloc)![index],
    );
  }

  List<Widget>? _pageWidgets(
      ScrollProvider scrollProvider,
      AppPageBloc appPageBloc,
      ) {
    AppPageState currentState = appPageBloc.state;

      return [
        const HomePageStepsWidgetWrapper(),
      ];
  }
}
