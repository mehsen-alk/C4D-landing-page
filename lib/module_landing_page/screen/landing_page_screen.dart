// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen();

  @override
  _LandingPageScreenState createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              var url =
                  'https://play.google.com/store/apps/details?id=de.yessoft.c4d_captain';
              var uri = Uri.tryParse(url);
              if (uri != null) {
                canLaunchUrl(uri).then((value) {
                  if (value) {
                    launchUrl(uri);
                  }
                });
              }
            },
            child: Text('press me'),
          ),
        ],
      ),
    );
  }
}
