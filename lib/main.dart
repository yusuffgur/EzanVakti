import 'package:EzanVakti/screens/home_page.dart';
import 'package:EzanVakti/screens/onboarding_page.dart';
import 'package:EzanVakti/ui/theme/theme.dart' show themeData;
import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlay;
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;

import 'ui/helper/AppStrings.dart' show AppStrings;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    initializeDateFormatting('tr');
    return MaterialApp(
      theme: themeData,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
