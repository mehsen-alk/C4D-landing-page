import 'package:injectable/injectable.dart';
import 'package:landing_page/abstracts/module/yes_module.dart';
import 'package:landing_page/module_splash/splash_routes.dart';
import 'package:landing_page/module_splash/ui/screen/splash_screen.dart';


@injectable
class SplashModule extends YesModule {
  SplashModule(SplashScreen splashScreen) {
    YesModule.RoutesMap.addAll(
        {SplashRoutes.SPLASH_SCREEN: (context) => splashScreen});
  }
}
