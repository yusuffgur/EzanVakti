import 'package:EzanVakti/ui/helper/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final Color color;
  const AppLogo({Key key, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppStrings.logoPath, height: height, color: color);
  }
}
