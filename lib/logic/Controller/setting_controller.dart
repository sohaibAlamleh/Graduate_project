import 'package:boat_rent_project/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var storage = GetStorage();
  var langLocal = eng;
  //Language
  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage();
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
    update();
  }

  //get language
  Future<String> getLanguage() async {
    langLocal = await storage.read("lang");
    return langLocal;
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = eng;
      saveLanguage(eng);
    }
    update();
  }
}
