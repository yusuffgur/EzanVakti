import 'package:flutter/material.dart';

import 'ui/helper/AppColors.dart';
import 'ui/helper/AppIcons.dart';
import 'ui/widgets/helper.dart';

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
      title: 'Material App',
      home: Scaffold(
        backgroundColor: themeData.backgroundColor,
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Helper.appLogo,
        ),
      ),
    );
  }
}
