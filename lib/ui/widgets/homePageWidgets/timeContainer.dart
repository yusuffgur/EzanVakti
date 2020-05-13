import 'package:EzanVakti/ui/helper/AppStrings.dart' show AppStrings;
import 'package:EzanVakti/ui/styles/appBorderRadius.dart' show AppBorderRadius;
import 'package:EzanVakti/ui/styles/appBoxShadow.dart' show AppBoxShadow;
import 'package:EzanVakti/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class TimeContainer extends StatefulWidget {
  @override
  _TimeContainerState createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  var now;
  final format = new DateFormat('EEEE dd MMMM yyyy', 'tr_TR');
  bool visibleRamazan = true;
  String differenceInDays = "";

  @override
  void initState() {
    super.initState();
    setState(() => ramazanFunc());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _buildBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(format.format(now).toString(), style: Theme.of(context).textTheme.headline6),
            Helper.sizedBoxH10,
            Visibility(visible: visibleRamazan, child: Text(AppStrings.ramazan + " " + differenceInDays, style: Theme.of(context).textTheme.headline6))
          ],
        ),
      ),
    );
  }

  void ramazanFunc() {
    now = new DateTime.now();
    var ramazanStarting = new DateTime.utc(2020, 4, 24);
    differenceInDays = (now.difference(ramazanStarting).inDays).toString();
    (now.difference(ramazanStarting).inDays) == 30 ? visibleRamazan = false : visibleRamazan = true;
  }

  BoxDecoration get _buildBoxDecoration =>
      BoxDecoration(color: Colors.white, borderRadius: AppBorderRadius.timeContainerRadius, boxShadow: [AppBoxShadow.containerBoxShadow]);
}
