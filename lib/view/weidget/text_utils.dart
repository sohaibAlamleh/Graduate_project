import 'package:boat_rent_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration textDecoration;

  const TextUtils({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textDecoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: Get.isDarkMode ? whiteColor : whiteColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}
