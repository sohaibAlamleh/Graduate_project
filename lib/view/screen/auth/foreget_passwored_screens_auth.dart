
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../weidget/auth/auth_button.dart';
import '../../weidget/auth/auth_text_from_field.dart';

class ForgetPasswordScreens extends StatefulWidget {
  ForgetPasswordScreens({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreens> createState() => _ForgetPasswordScreensState();
}

class _ForgetPasswordScreensState extends State<ForgetPasswordScreens> {
  final fromkey = GlobalKey<FormState>();

  final TextEditingController emailconontroller = TextEditingController();

  final controler = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? buttonColor : Colors.white,
          title: Text(
            'Forget Password',
            style: TextStyle(color: Get.isDarkMode ? mainColor : darkColor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Get.isDarkMode ? mainColor : Colors.white,
        body: Form(
          key: fromkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'if you want to recover your account,than pleas provide your email ID below ..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Image.asset(
                    'assets/images/foregetPasswored.png',
                    width: 250,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AuthTextFormFailed(
                    controller: emailconontroller,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return ('invalid email');
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Icon(
                            Icons.email,
                            color: buttonColor,
                            size: 30,
                          )
                        : Icon(
                            Icons.email,
                            color: mainColor,
                            size: 30,
                          ),
                    suffixIcon: const Text(''),
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        text: 'Send',
                        onPressed: () {
                          if (fromkey.currentState!.validate()) {
                            String email = emailconontroller.text.trim();
                            controler.restPassword(email);
                          }
                        });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
