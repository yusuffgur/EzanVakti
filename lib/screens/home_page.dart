import 'package:EzanVakti/ui/widgets/app_bar.dart';
import 'package:EzanVakti/ui/widgets/bottom_bar.dart';
import 'package:EzanVakti/ui/widgets/homePageWidgets/timeContainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 32, 22),
          child: Column(
            children: <Widget>[
              TimeContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
