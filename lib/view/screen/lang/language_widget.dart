import 'package:boat_rent_project/utils/my_string.dart';
import 'package:boat_rent_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
            color: Get.isDarkMode ? whiteColor : Colors.black, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Icon(Icons.arrow_drop_down,
              color: Get.isDarkMode ? whiteColor : Colors.black),
          iconSize: 25,
          items: const [
            DropdownMenuItem(
              value: 'en',
              child: Text(
                'English',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                'arabic',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
          value: Get.locale?.languageCode,
          onChanged: (value) {
            Get.updateLocale(Locale(value.toString()));
          },
        ),
      ),
    );
  }
}
