
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textundline;
  final Function() onPressed;

  ContainerUnder(
      {required this.text,
      required this.textundline,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? buttonColor : mainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
                text: text,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                textDecoration: TextDecoration.none),
            TextButton(
                onPressed: onPressed,
                child: TextUtils(
                    text: textundline,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    textDecoration: TextDecoration.underline))
          ],
        ),
      ),
    );
  }
}
