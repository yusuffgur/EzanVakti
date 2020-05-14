import 'package:flutter/material.dart';

class AppBorderRadius {
  static BorderRadius get appBarRadius => BorderRadius.vertical(bottom: Radius.circular(50));
  static BorderRadius get bottomBarRadius => BorderRadius.vertical(top: Radius.circular(50));
  static BorderRadius get onboardingBarRadius => BorderRadius.all(Radius.circular(50));
  static BorderRadius get timeContainerRadius => BorderRadius.all(Radius.circular(20));
  static RoundedRectangleBorder get fabRadius =>
      RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)));
}
