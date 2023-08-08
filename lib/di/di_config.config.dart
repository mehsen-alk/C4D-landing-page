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

import '../main.dart' as _i6;
import '../module_localization/persistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i3;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i4;
import '../utils/logger/logger.dart' as _i5;

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
  gh.factory<_i3.LocalizationPreferencesHelper>(
      () => _i3.LocalizationPreferencesHelper());
  gh.factory<_i4.LocalizationService>(
      () => _i4.LocalizationService(gh<_i3.LocalizationPreferencesHelper>()));
  gh.factory<_i5.Logger>(() => _i5.Logger());
  gh.factory<_i6.MyApp>(() => _i6.MyApp(gh<_i4.LocalizationService>()));
  return getIt;
}