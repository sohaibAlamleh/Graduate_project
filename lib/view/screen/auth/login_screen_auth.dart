import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../weidget/auth/auth_button.dart';
import '../../weidget/auth/auth_text_from_field.dart';
import '../../weidget/auth/container_under.dart';
import '../../weidget/text_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final controller = Get.put(AuthController());
  bool status = false;

  // final controllers= Get.lazyPut( () =>AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? buttonColor : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                            text: 'Log ',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? buttonColor : mainColor,
                            textDecoration: TextDecoration.none),
                        SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                            text: 'In',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            textDecoration: TextDecoration.none),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(height: 20),
                    AuthTextFormFailed(
                      controller: emailController,
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
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFormFailed(
                        controller: passwordController,
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
                        hintText: "Password",
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterSwitch(
                          activeText: "Owner",
                          inactiveText: "Renter",
                          value: status,
                          valueFontSize: 16.0,
                          inactiveColor: Colors.green,
                          width: 90,
                          height: 36,
                          borderRadius: 30.0,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                              print(status);
                            });
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routs.forget_poasswored_screens);
                            },
                            child: TextUtils(
                                text: 'Forget password ?',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                textDecoration: TextDecoration.none)),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                          text: 'Log In',
                          onPressed: () {
                            // if (formKey.currentState?.validate() != null) {
                            String email = emailController.text.trim();
                            String pass = passwordController.text;
                            controller.loginUsingFirebase(
                                email: email, password: pass, status: status);
                            // }
                          });
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextUtils(
                        text: 'OR',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        textDecoration: TextDecoration.none),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              // printKeyHash();
                              controller.signInWithFacebook();
                            },
                            child: Image.asset('assets/images/facebook.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return InkWell(
                              onTap: () {
                                controller.googleSignupApps();
                              },
                              child: Image.asset('assets/images/google.png'));
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't Have an Account ?",
              textundline: 'Sign Up',
              onPressed: () {
                Get.offNamed(Routs.signup_screens);
              },
            )
          ],
        ),
      ),
    ));
  }
}
