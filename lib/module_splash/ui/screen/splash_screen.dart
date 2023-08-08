// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:landing_page/module_landing_page/landing_page_routes.dart';

import 'package:landing_page/utils/images/images.dart';

@injectable
class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getNextRoute().then((route) {
        Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Image.asset(
          ImageAsset.LOGO,
          height: 150,
          width: 150,
        ),
      ),
    );
  }

  Future<String> _getNextRoute() async {
    return LandingPageRoutes.Landing_Page_SCREEN;
  }
}
