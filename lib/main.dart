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
import 'package:landing_page/module_localization/service/localization_service/localization_service.dart';
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

  const MyApp(this._localizationService);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String lang;

  @override
  void initState() {
    super.initState();
    lang = widget._localizationService.getLanguage();
    widget._localizationService.localizationStream.listen((event) {
      lang = event;
      setState(() {});
    });
  }

  Widget getConfiguredApp(Map<String, WidgetBuilder> fullRoutesList) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C4D',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(YesModule.RoutesMap);
  }
}
