import 'package:EzanVakti/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: Column(),
    );
  }
}
