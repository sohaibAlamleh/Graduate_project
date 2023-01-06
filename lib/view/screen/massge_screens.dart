import 'package:boat_rent_project/utils/theme/theme.dart';
import 'package:boat_rent_project/view/weidget/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../weidget/text_utils.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        height: double.infinity,
        color: Get.isDarkMode ? darkColor : Colors.blue.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextUtils(
                text: "Write Message",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? buttonColor : Colors.grey,
                textDecoration: TextDecoration.none),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              // maxLines: 15,
              // minLines: 12,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Write Message",
                  hintStyle: TextStyle(
                      color: Get.isDarkMode ? whiteColor : Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors
                              .blue))), //keyboardType : TextInputType.text,
            ),
            SizedBox(
              height: 30,
            ),
            AuthButton(text: "Send", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
