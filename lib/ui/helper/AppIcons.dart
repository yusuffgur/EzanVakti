import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mdi/mdi.dart';

import 'AppColors.dart';

class AppIcons {
  // Icons
  static final Icon location = Icon(Icons.location_on, color: AppColors.colorLightSecondary);
  static final Icon settings = Icon(Icons.settings, color: AppColors.colorLightSecondary);
  static final Icon navigateNext = Icon(Icons.navigate_next, color: AppColors.colorLightSecondary);
  static final Icon dropdown = Icon(Icons.arrow_drop_down, color: AppColors.colorLightSecondary);
  static final Icon mmoon = Icon(Mdi.moonWaningCrescent, color: AppColors.colorLightSecondary);
  static final SvgPicture imsak = SvgPicture.asset(imsakSVG, color: AppColors.colorLightSecondary, height: 20);
  static final SvgPicture sun = SvgPicture.asset(sunSVG, color: AppColors.colorLightSecondary, height: 20);
  static final SvgPicture noon = SvgPicture.asset(noonSVG, color: AppColors.colorLightSecondary, height: 20);
  static final SvgPicture afternoon = SvgPicture.asset(afternoonSVG, color: AppColors.colorLightSecondary, height: 20);
  static final SvgPicture evening = SvgPicture.asset(eveningSVG, color: AppColors.colorLightPrimary, height: 20);
  // #Icons

  // Svg icon path
  static const String imsakSVG = "assets/svg/imsak.svg";
  static const String sunSVG = "assets/svg/sunrise.svg";
  static const String noonSVG = "assets/svg/sun.svg";
  static const String afternoonSVG = "assets/svg/sunFill.svg";
  static const String eveningSVG = "assets/svg/sunset.svg";
  // #Svg icon path

}
