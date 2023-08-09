// ignore_for_file: use_key_in_widget_constructors
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';

import 'package:landing_page/abstracts/module/yes_module.dart';
import 'package:landing_page/di/di_config.dart';
import 'package:landing_page/generated/l10n.dart';
import 'package:landing_page/hive/hive_init.dart';
import 'package:landing_page/module_landing_page/landing_page_module.dart';
import 'package:landing_page/module_localization/service/localization_service/localization_service.dart';
import 'package:landing_page/module_splash/splash_module.dart';
import 'package:landing_page/module_splash/splash_routes.dart';
import 'package:landing_page/module_theme/service/theme_service/theme_service.dart';
import 'package:landing_page/utils/logger/logger.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await HiveSetUp.init();

    configureDependencies();
    runApp(getIt<MyApp>());
  }, (error, stackTrace) {
    if (kDebugMode) {
      print(error);
    }
    Logger().error(
        'Main', error.toString() + stackTrace.toString(), StackTrace.current);
  });
}

@injectable
class MyApp extends StatefulWidget {
  final LocalizationService _localizationService;
  final SplashModule _splashModule;
  final LandingPageModule _landingPageModule;
  final AppThemeDataService _themeDataService;


  const MyApp(
    this._localizationService,
    this._splashModule,
    this._landingPageModule, this._themeDataService,
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String lang;
  late ThemeData activeTheme;

  @override
  void initState() {
    super.initState();
    lang = widget._localizationService.getLanguage();
    activeTheme = widget._themeDataService.getActiveTheme();
    widget._localizationService.localizationStream.listen((event) {
      lang = event;
      setState(() {});
    });
    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  Widget getConfiguredApp(Map<String, WidgetBuilder> fullRoutesList) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C4D',
      theme: activeTheme,
      home: const Placeholder(),
      locale: Locale.fromSubtags(
        languageCode: lang,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(YesModule.RoutesMap);
  }
}
