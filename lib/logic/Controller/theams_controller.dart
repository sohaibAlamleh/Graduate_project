


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{

  final GetStorage getStorage=GetStorage();
  final Key='isDarkModes';

  saveThemeDataInBox(bool isDark){
    getStorage.write(Key, isDark);
  }
 bool getThemeDataFromBox(){
   return getStorage.read<bool>(Key) ?? false ;
  }

  ThemeMode get themeDataGet=> getThemeDataFromBox() ? ThemeMode.dark: ThemeMode.light;


  void changesTheme(){
    Get.changeThemeMode(
        getThemeDataFromBox() ?
        ThemeMode.light :
        ThemeMode.dark );

saveThemeDataInBox(!getThemeDataFromBox());

}


}