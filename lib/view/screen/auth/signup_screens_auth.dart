import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../weidget/auth/auth_button.dart';
import '../../weidget/auth/auth_text_from_field.dart';
import '../../weidget/auth/chek_widghit_auth.dart';
import '../../weidget/auth/container_under.dart';
import '../../weidget/auth/radio_button.dart';
import '../../weidget/text_utils.dart';

class SignUpScreens extends StatefulWidget {
  SignUpScreens({Key? key}) : super(key: key);

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  final TextEditingController nameconontroller = TextEditingController();

  final TextEditingController emailconontroller = TextEditingController();

  final TextEditingController phoneconontroller = TextEditingController();

  final TextEditingController passwordconontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

// final controller = Get.put(AuthController());
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? buttonColor : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 25, left: 25),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: 'Sign',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? buttonColor : mainColor,
                                textDecoration: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: 'UP',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                textDecoration: TextDecoration.none),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        AuthTextFormFailed(
                          controller: nameconontroller,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return ('Enter valid name');
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.person,
                                  color: buttonColor,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.person,
                                  color: mainColor,
                                  size: 30,
                                ),
                          suffixIcon: const Text(''),
                          hintText: "Enter your User Name",
                        ),
                        SizedBox(height: 20),
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
                          hintText: "Enter your Email",
                        ),
                        SizedBox(height: 20),
                        AuthTextFormFailed(
                          controller: phoneconontroller,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationPhone).hasMatch(value)) {
                              return ('invalid phone');
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.phone,
                                  color: buttonColor,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.phone,
                                  color: mainColor,
                                  size: 30,
                                ),
                          suffixIcon: const Text(''),
                          hintText: "Enter your phone number",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormFailed(
                            controller: passwordconontroller,
                            obscureText: controller.isvisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return ('password should be long or equal to 6 characters');
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Icon(
                                    Icons.lock,
                                    color: buttonColor,
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.lock,
                                    color: mainColor,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isvisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            hintText: "Enter your Password",
                          );
                        }),
                        SizedBox(
                          height: 50,
                        ),
                        // RadioButton(),
                        CheackWidghet(),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                              text: 'Sign Up',
                              onPressed: () async {
                                //check box is not checking
                                if (controller.ischeckbox == false) {
                                  Get.snackbar("Check Box",
                                      "please Accept terms & conditions",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white);
                                } else if (formKey.currentState!.validate()) {
                                  String name = nameconontroller.text.trim();
                                  String email = emailconontroller.text.trim();
                                  String password =
                                      passwordconontroller.text.trim();
                                  String phone = phoneconontroller.text.trim();
                                  controller.signUpUsingFirebase(
                                      name: name,
                                      email: email,
                                      password: password,
                                      phone: phone);
                                }
                                controller.ischeckbox = true;
                              });
                        })
                      ],
                    ),
                  ),
                ),
                ContainerUnder(
                  text: 'Already Have account ?',
                  textundline: 'Log in',
                  onPressed: () {
                    Get.offNamed(Routs.lognin_screens);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
