import 'package:EzanVakti/ui/helper/AppStrings.dart';
import 'package:EzanVakti/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Helper {
  static SizedBox get sizedBoxH10 => SizedBox(height: 10);
  static SizedBox get sizedBoxH20 => SizedBox(height: 20);
  static SizedBox get sizedBoxH30 => SizedBox(height: 30);
  static SizedBox get sizedBoxH50 => SizedBox(height: 50);
  static SizedBox get sizedBoxH100 => SizedBox(height: 100);
  static SizedBox get sizedBoxW10 => SizedBox(width: 10);
  static SizedBox get sizedBoxW20 => SizedBox(width: 20);

  static SvgPicture appLogo(double _height) => SvgPicture.asset(AppStrings.logoPath, height: _height, color: themeData.accentColor);
}
