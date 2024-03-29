import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:landing_page/module_theme/map_style.dart';
import 'package:landing_page/module_theme/pressistance/theme_preferences_helper.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
    return const Color.fromRGBO(33, 32, 156, 1);
  }

  ThemeData getActiveTheme() {
    var dark = _preferencesHelper.isDarkMode();
    final lightScheme = ColorScheme.fromSeed(
      seedColor: PrimaryColor,
      background: const Color.fromRGBO(236, 239, 241, 1),
    );
    final darkScheme = ColorScheme.fromSeed(
        seedColor: PrimaryColor,
        brightness: Brightness.dark,
        error: Colors.red[900],
        errorContainer: Colors.red[100],
        primaryContainer: Colors.grey[500],
        primary: Colors.grey[900],
        secondary: Colors.grey.shade600,
        secondaryContainer: Colors.grey.shade900,
        background: Colors.grey.shade800);
    if (dark == true) {
      mapStyle(dark);
      return ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade700,
          brightness: Brightness.dark,
          colorScheme: darkScheme,
          useMaterial3: true,
          primarySwatch: Colors.indigo,
          focusColor: PrimaryColor,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.white70)),
          checkboxTheme: CheckboxThemeData(
            checkColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.grey;
              }
              return Colors.white;
            }),
            fillColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.black;
              }
              return Colors.indigo;
            }),
          ),
          cardColor: Colors.grey[150],
          fontFamily: 'Dubai',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: darkScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          )),
          textTheme: const TextTheme(
            button: TextStyle(
              color: Colors.white,
            ),
          ));
    }
    mapStyle(dark);
    return ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50],
        //       primaryColor: PrimaryColor,
        colorScheme: lightScheme,
        useMaterial3: true,
        //    colorScheme: lightScheme,
        focusColor: PrimaryColor,
        primarySwatch: Colors.indigo,
        cardColor: const Color.fromRGBO(245, 245, 245, 1),
        textTheme: const TextTheme(button: TextStyle(color: Colors.white)),
        fontFamily: 'Dubai',
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: lightScheme.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        )),
        timePickerTheme: const TimePickerThemeData(
          dialBackgroundColor: Color.fromRGBO(235, 235, 235, 1),
          dayPeriodBorderSide:
              BorderSide(color: Color.fromRGBO(235, 235, 235, 1)),
        ));
  }

  void switchDarkMode(bool darkMode) async {
    if (darkMode) {
      _preferencesHelper.setDarkMode();
    } else {
      _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }

  void mapStyle(bool darkMode) {
    String darkStyle = MapStyle.darkStyle;

    String lightStyle = '''[]''';

    if (darkMode) {
      _preferencesHelper.setMapStyle(darkStyle);
    } else {
      _preferencesHelper.setMapStyle(lightStyle);
    }
  }
}
