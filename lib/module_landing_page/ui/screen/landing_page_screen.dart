// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:landing_page/generated/l10n.dart';
import 'package:landing_page/module_landing_page/ui/widget/app_widget.dart';
import 'package:landing_page/utils/global/screen_type.dart';
import 'package:landing_page/utils/images/images.dart';

@injectable
class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen();

  @override
  _LandingPageScreenState createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var backgroundImagePath = ScreenType.isMobile(context)
        ? ImageAsset.PHONE_BACKGROUND
        : ImageAsset.PC_BACKGROUND;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          backgroundImagePath,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: ResponsiveLayout(
              desktopBody: Column(
                children: [
                  Row(),
                  SizedBox(height: 30),
                  Text(
                    S.current.welcomeToC4DApps,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 70),
                  // store app widget
                  AppWidgetDesktop(
                    title: S.current.storeWidgetTitle,
                    description: S.current.storeWidgetDescription,
                    googleButtonUrl:
                        'https://play.google.com/store/apps/details?id=de.yessoft.c4d_store',
                    appleButtonUrl:
                        'https://apps.apple.com/us/app/c4d/id1564653150?platform=iphone',
                    appleQrCodePath: ImageAsset.QR_STORE_APPEl,
                    googleQrCodePath: ImageAsset.QR_STORE_GOOGLE,
                    imagePath: ImageAsset.STORE_PHONE,
                  ),
                  SizedBox(height: 100),
                  // captain app widget
                  AppWidgetDesktop(
                    title: S.current.captainWidgetTitle,
                    description: S.current.captainWidgetDescription,
                    googleButtonUrl:
                        'https://play.google.com/store/apps/details?id=de.yessoft.c4d_captain&pli=1',
                    appleButtonUrl:
                        'https://apps.apple.com/us/app/c4d-captain/id1620230998',
                    appleQrCodePath: ImageAsset.QR_CAPTAIN_APPEL,
                    googleQrCodePath: ImageAsset.QR_CAPTAIN_GOOGLE,
                    imagePath: ImageAsset.CAPTAIN_PHONE,
                  ),
                  SizedBox(height: 100),

                  SizedBox(height: 100),
                ],
              ),
              mobileBody: Column(
                children: [
                  Row(),
                  SizedBox(height: 30),
                  Text(
                    S.current.welcomeToC4DApps,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 70),
                  // store app widget
                  AppWidgetPhone(
                    title: S.current.storeWidgetTitle,
                    description: S.current.storeWidgetDescription,
                    googleButtonUrl:
                        'https://play.google.com/store/apps/details?id=de.yessoft.c4d_store',
                    appleButtonUrl:
                        'https://apps.apple.com/us/app/c4d/id1564653150?platform=iphone',
                    appleQrCodePath: ImageAsset.QR_STORE_APPEl,
                    googleQrCodePath: ImageAsset.QR_STORE_GOOGLE,
                    imagePath: ImageAsset.STORE_PHONE,
                  ),
                  SizedBox(height: 100),
                  // captain app widget
                  AppWidgetPhone(
                    title: S.current.captainWidgetTitle,
                    description: S.current.captainWidgetDescription,
                    googleButtonUrl:
                        'https://play.google.com/store/apps/details?id=de.yessoft.c4d_captain&pli=1',
                    appleButtonUrl:
                        'https://apps.apple.com/us/app/c4d-captain/id1620230998',
                    appleQrCodePath: ImageAsset.QR_CAPTAIN_APPEL,
                    googleQrCodePath: ImageAsset.QR_CAPTAIN_GOOGLE,
                    imagePath: ImageAsset.CAPTAIN_PHONE,
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
