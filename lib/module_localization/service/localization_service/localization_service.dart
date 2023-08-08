import 'dart:io' as plat;
import 'package:injectable/injectable.dart';
import 'package:landing_page/module_localization/persistance/localization_preferences_helper/localization_preferences_helper.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:rxdart/rxdart.dart';

@injectable
@singleton
class LocalizationService {
  final LocalizationPreferencesHelper _preferencesHelper;
  static final PublishSubject<String> _localizationSubject =
      PublishSubject<String>();
  Stream<String> get localizationStream => _localizationSubject.stream;
  LocalizationService(this._preferencesHelper);

  void setLanguage(String lang) {
    _preferencesHelper.setLanguage(lang);
  }

  String getLanguage() {
    String? lang = _preferencesHelper.getLanguage();
    if (kIsWeb) {
      lang ??= 'ar';
    } else {
      lang ??= plat.Platform.localeName.substring(0, 2);
    }
    return lang;
  }

  bool choosed() {
    String? lang = _preferencesHelper.getLanguage();
    return lang != null;
  }
}
