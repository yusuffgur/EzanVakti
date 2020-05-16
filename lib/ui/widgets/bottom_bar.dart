import 'package:EzanVakti/models/result.dart';
import 'package:EzanVakti/ui/helper/AppColors.dart';
import 'package:EzanVakti/ui/helper/AppIcons.dart' show AppIcons;
import 'package:EzanVakti/ui/helper/AppStrings.dart' show AppStrings;
import 'package:EzanVakti/ui/styles/appBoxShadow.dart' show AppBoxShadow;
import 'package:EzanVakti/ui/styles/appborderRadius.dart' show AppBorderRadius;
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'helper.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final TextEditingController cityTextController = TextEditingController();
  final TextEditingController districtTextController = TextEditingController();
  List<City> cityResult = [];
  List<District> districtResult = [];
  String selectedCity = "";
  String selectedDistrict = "";
  String selectedDistrictId = "";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration,
      child: ClipRRect(
        borderRadius: AppBorderRadius.bottomBarRadius,
        child: Container(
          height: 80,
          child: BottomNavigationBar(
            currentIndex: 1,
            unselectedIconTheme: Theme.of(context).iconTheme,
            selectedIconTheme: Theme.of(context).iconTheme,
            items: <BottomNavigationBarItem>[
              //BUG // TODO -> works when click on icon
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 23,
                  height: 23,
                  child: IconButton(padding: new EdgeInsets.all(0.0), icon: Icon(AppIcons.location), onPressed: () => showSelectCity()),
                ),
                title: Text(AppStrings.location, style: Theme.of(context).textTheme.button),
              ),
              BottomNavigationBarItem(icon: Icon(AppIcons.home), title: Text(AppStrings.homePage, style: Theme.of(context).textTheme.button)),
              BottomNavigationBarItem(icon: Icon(AppIcons.moon), title: Text(AppStrings.darkMode, style: Theme.of(context).textTheme.button)),
            ],
          ),
        ),
      ),
    );
  }

  void showSelectCity() {
    clearTextEditing();
    _getCityData();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.colorAlertDialogBack,
            shape: AppBorderRadius.alertDialogRadius,
            title: Text(AppStrings.changeLocation, style: Theme.of(context).textTheme.headline6),
            content: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: <Widget>[
                    TypeAheadFormField(
                      getImmediateSuggestions: true,
                      itemBuilder: (context, suggestion) => Card(child: ListTile(title: Text(suggestion))),
                      onSuggestionSelected: (suggestion) => onCitySuggestionSelected(suggestion),
                      suggestionsCallback: (pattern) => getCitySuggestions(pattern),
                      errorBuilder: (context, Object error) => Text(AppStrings.errorCity),
                      noItemsFoundBuilder: (context) => buildNoItemsBuilder(context, AppStrings.city),
                      textFieldConfiguration: buildTextFieldConfiguration(context, this.cityTextController, AppStrings.selectCity),
                      onSaved: (value) => onCitySuggestionSelected(value),
                    ),
                    Helper.sizedBoxH10,
                    TypeAheadFormField(
                      getImmediateSuggestions: true,
                      itemBuilder: (context, suggestion) => Card(child: ListTile(title: Text(suggestion))),
                      onSuggestionSelected: (suggestion) => onDistrictSuggestionSelected(suggestion),
                      suggestionsCallback: (String pattern) => getDistrictSuggestions(pattern),
                      errorBuilder: (context, Object error) => Text(AppStrings.errorCity),
                      noItemsFoundBuilder: (context) => buildNoItemsBuilder(context, AppStrings.district),
                      textFieldConfiguration: buildTextFieldConfiguration(context, this.districtTextController, AppStrings.selectDistrict),
                      onSaved: (value) => this.selectedDistrict = value,
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(shape: AppBorderRadius.alertDialogRadius, child: Text(AppStrings.cancel), onPressed: () => clickCancelBtn()),
                        Helper.sizedBoxW10,
                        FlatButton(
                          color: Theme.of(context).primaryColor.withOpacity(0.30),
                          shape: AppBorderRadius.alertDialogRadius,
                          child: Text(AppStrings.add),
                          onPressed: () => clickAddBtn(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void onCitySuggestionSelected(String suggestion) {
    this.cityTextController.text = suggestion;
    this.selectedCity = suggestion;
    print("DEBUG");
    print("DEBUG´2");
    String id;
    try {
      print("DEBUG3");

      cityResult.asMap().forEach((index, element) {
        print("DEBUG MAP");
        if ((element.sehirAdi) == suggestion) {
          print("DEBUG IF ELSE");

          id = element.sehirId;
          print("sehir id :" + element.sehirId + " " + id);
          _getDistrictData(id);
        }
      });
    } catch (e) {
      print(e.error);
    }
  }

  void _getCityData() async {
    List<City> _cityTemp = await getCityData();
    setState(() {
      cityResult = _cityTemp;
    });
  }

  void _getDistrictData(String _selectedCityId) async {
    List<District> _districtTemp = await getDistrictData(_selectedCityId);
    setState(() {
      districtResult = _districtTemp;
    });
  }

  List<String> getCitySuggestions(String query) {
    List<String> cities = List();
    cityResult.forEach((element) {
      cities.add(element.sehirAdi);
    });
    cities.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    return cities;
  }

  List<String> getDistrictSuggestions(String query) {
    List<String> districts = List();
    districtResult.forEach((element) {
      districts.add(element.ilceAdi);
    });
    districts.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    return districts;
  }

  void onDistrictSuggestionSelected(String suggestion) {
    this.districtTextController.text = suggestion;
    this.selectedDistrict = suggestion;
  }

  void clearTextEditing() {
    cityTextController.text = "";
    districtTextController.text = "";
  }

  void clickCancelBtn() {
    clearTextEditing();
    Navigator.pop(context, true);
  }

  void clickAddBtn() {}

  TextFieldConfiguration buildTextFieldConfiguration(BuildContext context, TextEditingController _typeAheadController, String _hintText) {
    return TextFieldConfiguration(
      controller: _typeAheadController,
      cursorColor: Theme.of(context).primaryColorLight,
      autocorrect: true,
      decoration: InputDecoration(
        suffixIcon: Icon(AppIcons.dropdown),
        filled: true,
        fillColor: Theme.of(context).accentColor,
        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor), borderRadius: AppBorderRadius.textEditingBorderRadius),
        hintText: _hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Padding buildNoItemsBuilder(BuildContext context, String itemTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text("$itemTitle Bulunamadı", textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).disabledColor, fontSize: 18.0)),
    );
  }

  BoxDecoration get _buildBoxDecoration =>
      BoxDecoration(color: Colors.white, borderRadius: AppBorderRadius.bottomBarRadius, boxShadow: [AppBoxShadow.materialShadow]);
}
