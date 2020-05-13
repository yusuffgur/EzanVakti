import 'package:EzanVakti/ui/theme/theme.dart' show themeData;
import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlay;
import 'package:intl/date_symbol_data_local.dart';

import 'screens/home_page.dart' show HomePage;
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
