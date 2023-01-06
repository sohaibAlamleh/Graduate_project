
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/auth_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class CheackWidghet extends StatelessWidget {
  CheackWidghet({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkbox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: controller.ischeckbox
                    ? Get.isDarkMode
                        ? Icon(
                            Icons.done,
                            color: buttonColor,
                          )
                        : Image.asset('assets/images/check.png')
                    : Container()),
          ),
          TextUtils(
              text: '  I accept ',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              textDecoration: TextDecoration.none),
          TextUtils(
              text: 'Terms & conditions ',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              textDecoration: TextDecoration.underline),
        ],
      );
    });
  }
}
