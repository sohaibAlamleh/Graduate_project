import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  void showSnackBar(String text) {
    Get.snackbar(
      'confirm send message'.tr,
      text,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(text),
        //backgroundColor: Colors.red,
      ),
    );
  }

  const AuthButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? Colors.red : mainColor,
          minimumSize: const Size(360, 50)),
      child: TextUtils(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          textDecoration: TextDecoration.none),
    );
  }
}
