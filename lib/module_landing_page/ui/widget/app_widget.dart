import 'package:flutter/material.dart';
import 'package:landing_page/utils/images/images.dart';
import 'package:url_launcher/url_launcher.dart';

class AppWidgetDesktop extends StatelessWidget {
  final String title;
  final String description;
  final String googleButtonUrl;
  final String appleButtonUrl;
  final String googleQrCodePath;
  final String appleQrCodePath;
  final String imagePath;

  const AppWidgetDesktop({
    super.key,
    required this.title,
    required this.description,
    required this.googleButtonUrl,
    required this.appleButtonUrl,
    required this.googleQrCodePath,
    required this.appleQrCodePath,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                description,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StoresLinksWidget(
                    buttonImagePath: ImageAsset.GOOGLE_DOWNLOAD_BUTTON,
                    buttonUrl: googleButtonUrl,
                    qrCodeImagePath: googleQrCodePath,
                  ),
                  SizedBox(width: 20),
                  StoresLinksWidget(
                    buttonImagePath: ImageAsset.APPLE_DOWNLOAD_BUTTON,
                    buttonUrl: appleButtonUrl,
                    qrCodeImagePath: appleQrCodePath,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.75,
          child: Image.asset(imagePath),
        ),
      ],
    );
  }
}

class AppWidgetPhone extends StatelessWidget {
  final String title;
  final String description;
  final String googleButtonUrl;
  final String appleButtonUrl;
  final String googleQrCodePath;
  final String appleQrCodePath;
  final String imagePath;

  const AppWidgetPhone({
    super.key,
    required this.title,
    required this.description,
    required this.googleButtonUrl,
    required this.appleButtonUrl,
    required this.googleQrCodePath,
    required this.appleQrCodePath,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.95,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                description,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StoresLinksWidget(
                    buttonImagePath: ImageAsset.GOOGLE_DOWNLOAD_BUTTON,
                    buttonUrl: googleButtonUrl,
                    qrCodeImagePath: googleQrCodePath,
                  ),
                  SizedBox(width: 20),
                  StoresLinksWidget(
                    buttonImagePath: ImageAsset.APPLE_DOWNLOAD_BUTTON,
                    buttonUrl: appleButtonUrl,
                    qrCodeImagePath: appleQrCodePath,
                  ),
                ],
              ),
            ],
          ),
        ),
        // SizedBox(width: 20),
        // SizedBox(
        //   height: MediaQuery.sizeOf(context).height * 0.75,
        //   child: Image.asset(imagePath),
        // ),
      ],
    );
  }
}

class StoresLinksWidget extends StatelessWidget {
  const StoresLinksWidget({
    super.key,
    required this.buttonUrl,
    required this.qrCodeImagePath,
    required this.buttonImagePath,
  });

  final String buttonUrl;
  final String qrCodeImagePath;
  final String buttonImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () async {
            var uri = Uri.tryParse(buttonUrl);
            if (uri != null && await canLaunchUrl(uri)) {
              launchUrl(uri);
            }
          },
          child: SizedBox(
            height: 100,
            child: Image.asset(qrCodeImagePath),
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () async {
            var uri = Uri.tryParse(buttonUrl);
            if (uri != null && await canLaunchUrl(uri)) {
              launchUrl(uri);
            }
          },
          child: Container(
            constraints: BoxConstraints(maxHeight: 56),
            child: Image.asset(buttonImagePath),
          ),
        ),
      ],
    );
  }
}
