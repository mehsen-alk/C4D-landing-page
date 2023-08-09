// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i12;
import '../module_landing_page/landing_page_module.dart' as _i10;
import '../module_landing_page/ui/screen/landing_page_screen.dart' as _i3;
import '../module_localization/persistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i4;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i5;
import '../module_splash/splash_module.dart' as _i11;
import '../module_splash/ui/screen/splash_screen.dart' as _i7;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i8;
import '../module_theme/service/theme_service/theme_service.dart' as _i9;
import '../utils/logger/logger.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.LandingPageScreen>(() => _i3.LandingPageScreen());
  gh.factory<_i4.LocalizationPreferencesHelper>(
      () => _i4.LocalizationPreferencesHelper());
  gh.factory<_i5.LocalizationService>(
      () => _i5.LocalizationService(gh<_i4.LocalizationPreferencesHelper>()));
  gh.factory<_i6.Logger>(() => _i6.Logger());
  gh.factory<_i7.SplashScreen>(() => _i7.SplashScreen());
  gh.factory<_i8.ThemePreferencesHelper>(() => _i8.ThemePreferencesHelper());
  gh.factory<_i9.AppThemeDataService>(
      () => _i9.AppThemeDataService(gh<_i8.ThemePreferencesHelper>()));
  gh.factory<_i10.LandingPageModule>(
      () => _i10.LandingPageModule(gh<_i3.LandingPageScreen>()));
  gh.factory<_i11.SplashModule>(
      () => _i11.SplashModule(gh<_i7.SplashScreen>()));
  gh.factory<_i12.MyApp>(() => _i12.MyApp(
        gh<_i5.LocalizationService>(),
        gh<_i11.SplashModule>(),
        gh<_i10.LandingPageModule>(),
        gh<_i9.AppThemeDataService>(),
      ));
  return getIt;
}
