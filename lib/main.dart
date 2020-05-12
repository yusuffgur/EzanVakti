import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'ui/helper/AppColors.dart';
import 'ui/helper/AppStrings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final themeData = ThemeData(
    primaryColor: AppColors.colorLightPrimary,
    accentColor: AppColors.colorLightSecondary,
    backgroundColor: AppColors.colorLightSecondary,
    primaryColorDark: AppColors.colorDarkPrimary,
    splashColor: AppColors.colorLightPrimary,
    textTheme: TextTheme(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: AppStrings.appName,
      home: HomePage(),
    );
  }
}
