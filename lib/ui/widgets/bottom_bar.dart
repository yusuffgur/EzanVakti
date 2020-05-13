import 'package:EzanVakti/ui/helper/AppIcons.dart' show AppIcons;
import 'package:EzanVakti/ui/helper/AppStrings.dart' show AppStrings;
import 'package:EzanVakti/ui/styles/appBoxShadow.dart' show AppBoxShadow;
import 'package:EzanVakti/ui/styles/appborderRadius.dart' show AppBorderRadius;
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration,
      child: ClipRRect(
          borderRadius: AppBorderRadius.bottomBarRadius,
          child: Container(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: 1,
              unselectedIconTheme: Theme.of(context).iconTheme,
              selectedIconTheme: Theme.of(context).iconTheme,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(AppIcons.location), title: Text(AppStrings.location, style: Theme.of(context).textTheme.button)),
                BottomNavigationBarItem(icon: Icon(AppIcons.home), title: Text(AppStrings.homePage, style: Theme.of(context).textTheme.button)),
                BottomNavigationBarItem(icon: Icon(AppIcons.moon), title: Text(AppStrings.darkMode, style: Theme.of(context).textTheme.button)),
              ],
            ),
          )),
    );
  }

  BoxDecoration get _buildBoxDecoration =>
      BoxDecoration(color: Colors.white, borderRadius: AppBorderRadius.bottomBarRadius, boxShadow: [AppBoxShadow.materialShadow]);
}
