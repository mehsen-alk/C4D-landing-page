// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To C4D Apps`
  String get welcomeToC4DApps {
    return Intl.message(
      'Welcome To C4D Apps',
      name: 'welcomeToC4DApps',
      desc: '',
      args: [],
    );
  }

  /// `Delivery without commission`
  String get storeWidgetTitle {
    return Intl.message(
      'Delivery without commission',
      name: 'storeWidgetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Call 4 Delivery\nAnd make your customers satisfied and happy\nThrough the c4d delivery service, guarantee speed, safety and trust with your customers`
  String get storeWidgetDescription {
    return Intl.message(
      'Call 4 Delivery\nAnd make your customers satisfied and happy\nThrough the c4d delivery service, guarantee speed, safety and trust with your customers',
      name: 'storeWidgetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Have a car? let's earn some money`
  String get captainWidgetTitle {
    return Intl.message(
      'Have a car? let\'s earn some money',
      name: 'captainWidgetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Download the c4d app, receive orders, and make profits at any time`
  String get captainWidgetDescription {
    return Intl.message(
      'Download the c4d app, receive orders, and make profits at any time',
      name: 'captainWidgetDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
