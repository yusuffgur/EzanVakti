import 'package:EzanVakti/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_page.dart';
import 'ui/helper/AppStrings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return MaterialApp(
      theme: themeData,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
