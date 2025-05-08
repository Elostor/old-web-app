import 'package:OldWebApp/constants/themes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeType> {
  ThemeCubit() : super(ThemeType.darkGreen); // Initial value

  void updateTheme(ThemeType themeType) => emit(themeType);

  @override
  ThemeType? fromJson(Map<String, dynamic> json ) {
    final theme = json['themeType'];

    // Add new themes from here, then add the same values to themes.dart
    switch (theme) {
      case 'ThemeType.darkGreen' :
        return ThemeType.darkGreen;
  }
  return ThemeType.darkGreen;
  }

  @override
  Map<String, dynamic>? toJson(ThemeType state) {
    return {
      'themeType' : state.toString(),
    };
  }
}