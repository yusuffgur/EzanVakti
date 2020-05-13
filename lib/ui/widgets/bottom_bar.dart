import 'package:EzanVakti/ui/helper/AppIcons.dart';
import 'package:EzanVakti/ui/helper/AppStrings.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          child: Container(
            height: 70,
            color: Colors.white,
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
}
