import 'package:boat_rent_project/utils/language/ar.dart';
import 'package:boat_rent_project/utils/language/en.dart';
import 'package:boat_rent_project/utils/my_string.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        eng: en,
        ara: ar,
      };
}
