import 'package:boat_rent_project/logic/Controller/setting_controller.dart';
import 'package:boat_rent_project/utils/my_string.dart';
import 'package:boat_rent_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatefulWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.put(SettingController());
  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => Row(
              children: [
                Container(
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                        color: Get.isDarkMode ? whiteColor : Colors.black,
                        width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down,
                          color: Get.isDarkMode ? whiteColor : Colors.black),
                      iconSize: 25,
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(
                            'English'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'ar',
                          child: Text(
                            'arabic'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                      value: controller.langLocal,
                      onChanged: (value) {
                        controller.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      },
                    ),
                  ),
                ),
              ],
            ));
  }
}
