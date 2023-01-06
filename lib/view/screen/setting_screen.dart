import 'dart:io';

import 'package:boat_rent_project/logic/model/image.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/Controller/auth_controller.dart';
import '../../logic/Controller/theams_controller.dart';
import '../../utils/theme/theme.dart';
import 'lang/language_widget.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({Key? key}) : super(key: key);

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  GetImage m = GetImage();
  bool isSwi = false;
  final controller = Get.put(AuthController());

  String? image;

  @override
  void initState() {
    getImage();
    super.initState();
  }

  void getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString('image');
    });

/*

    void removeImage() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('image');
      getImage();
      setState(() {});
    }
*/
  }

  @override
  Widget build(BuildContext context) {
    //var photo = ModalRoute.of(context)!.settings.arguments as String;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isSwi ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: Get.isDarkMode ? darkColor : Colors.white,
        body: Center(
            child: Column(
                /*mainAxisAlignment: MainAxisAlignment.center*/ children: [
              /*        ClipOval(
            child: image != null
                ? Image.file(
                    File(image!),
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/download (2).png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),*/

              const SizedBox(height: 70),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: image != null
                          ? Image.file(
                              File(image!),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/download (2).png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FirebaseAuth.instance.currentUser != null
                            ? FirebaseAuth.instance.currentUser!.displayName!
                            : 'user name',
                        style: TextStyle(
                            color: Get.isDarkMode ? whiteColor : Colors.grey),
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser != null
                            ? FirebaseAuth.instance.currentUser!.email!
                            : 'user email',
                        style: TextStyle(
                            color: Get.isDarkMode ? whiteColor : Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'phone number  ',
                style: TextStyle(
                    fontSize: 15,
                    color: Get.isDarkMode ? whiteColor : Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                          color: Get.isDarkMode ? whiteColor : Colors.black,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Switch(
                      value: isSwi,
                      onChanged: (value) {
                        ThemeController().changesTheme();
                        setState(() {
                          isSwi = !isSwi;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Change Language',
                          style: TextStyle(
                              color: Get.isDarkMode ? whiteColor : Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      const SizedBox(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: LanguageWidget(),
                      ),
                    ]),
              ),
              // TextButton(
              //   onPressed: () {
              //     ThemeController().changesTheme();
              //   },
              //   child: Text('Change Theme ',
              //       style:
              //           TextStyle(color: Get.isDarkMode ? whiteColor : Colors.grey)),
              // ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<AuthController>(builder: (controlar) {
                return TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'Log out From App',
                          titleStyle: TextStyle(
                              fontSize: 18,
                              color: Get.isDarkMode ? whiteColor : Colors.white,
                              fontWeight: FontWeight.bold),
                          middleText: 'Are you sure you need logout',
                          middleTextStyle: TextStyle(
                              fontSize: 18,
                              color: Get.isDarkMode ? whiteColor : Colors.white,
                              fontWeight: FontWeight.bold),
                          backgroundColor: Colors.grey,
                          radius: 10,
                          textCancel: 'No',
                          cancelTextColor:
                              Get.isDarkMode ? whiteColor : Colors.black,
                          textConfirm: 'yes',
                          confirmTextColor:
                              Get.isDarkMode ? whiteColor : Colors.black,
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            controller.signOutFromApp();
                          },
                          buttonColor: Get.isDarkMode ? mainColor : mainColor);
                      //controlar.signOutFromApp();
                    },
                    child: Text('Log Out ',
                        style: TextStyle(
                            color: Get.isDarkMode ? whiteColor : Colors.grey)));
              }),
            ])),
      ),
    );
  }
}
