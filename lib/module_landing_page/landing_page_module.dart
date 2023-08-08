// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:landing_page/abstracts/module/yes_module.dart';
import 'package:landing_page/module_landing_page/landing_page_routes.dart';
import 'package:landing_page/module_landing_page/screen/landing_page_screen.dart';

@injectable
class LandingPageModule extends YesModule {
  final LandingPageScreen _landingPageScreen;

  LandingPageModule(
    this._landingPageScreen,
  ) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      LandingPageRoutes.Landing_Page_SCREEN: (context) => _landingPageScreen,
    };
  }
}
