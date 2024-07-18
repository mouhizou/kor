import 'package:flutter/material.dart';
import 'package:korane/theme/themes.dart';

class theme_prov extends ChangeNotifier{
  ThemeData maintheme = lighttheme;
  ThemeData get themedata => maintheme;
  bool get isdarckmode => maintheme == darcktheme;
  set themedata (ThemeData newtheme){
    maintheme = newtheme;
    notifyListeners();
  }
  void toglethemes(){
    if(maintheme == darcktheme){
      themedata = lighttheme;
    }else{
      themedata=darcktheme;
    }
  }
}