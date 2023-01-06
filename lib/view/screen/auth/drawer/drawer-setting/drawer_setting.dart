import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../logic/Controller/auth_controller.dart';
import '../../../../../logic/Controller/theams_controller.dart';
import '../../../../../utils/theme.dart';

import '../../../favorites_screens.dart';

import '../../../lang/language_widget.dart';
import '../../../setting_screen.dart';

class DrawerSetting extends StatefulWidget {
  const DrawerSetting({
    super.key,
  });

  @override
  State<DrawerSetting> createState() => _DrawerSettingState();
}

class _DrawerSettingState extends State<DrawerSetting> {
  final controller = Get.put(AuthController());
  bool isSwi = false;

//final int phone;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    //var phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.phone_android,
            color: Get.isDarkMode ? whiteColor : mainColor,
          ),
          title: Text(
            // phone!
            '',
            style: TextStyle(color: Get.isDarkMode ? whiteColor : mainColor),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.dark_mode,
                color: Get.isDarkMode ? whiteColor : mainColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text('Dark Mode',
                style: TextStyle(
                    color: Get.isDarkMode ? whiteColor : mainColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15)),
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
        Row(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              Icons.language,
              color: Get.isDarkMode ? whiteColor : mainColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text('Change Language',
              style: TextStyle(
                  color: Get.isDarkMode ? whiteColor : mainColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15)),
          const SizedBox(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: LanguageWidget(),
          ),
        ]),
        // ListTile(
        //   leading: Icon(
        //     Icons.language,
        //     color: Get.isDarkMode ? whiteColor : mainColor,
        //   ),
        //   title: Text(' Change Language',
        //       style: TextStyle(color: Get.isDarkMode ? whiteColor : mainColor)),
        // ),
        ListTile(
          leading: Icon(
            Icons.privacy_tip,
            color: Get.isDarkMode ? whiteColor : mainColor,
          ),
          title: Text('Terms and Conditions',
              style: TextStyle(color: Get.isDarkMode ? whiteColor : mainColor)),
        ),
        ListTile(
          leading: Icon(Icons.favorite,
              color: Get.isDarkMode ? whiteColor : mainColor),
          title: Text('Favourite',
              style: TextStyle(color: Get.isDarkMode ? whiteColor : mainColor)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FavoritesScreens()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,
              color: Get.isDarkMode ? whiteColor : mainColor),
          title: Text('Setting',
              style: TextStyle(color: Get.isDarkMode ? whiteColor : mainColor)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingScreens()));
            //Get.back();
            // GetPage(name: '/setting', page: () => const SettingScreens());
            // Navigator.of(context).maybePop(MaterialPageRoute(
            //     builder: (context) => const SettingScreens()));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout,
              color: Get.isDarkMode ? whiteColor : mainColor),
          title: Text('Logout',
              style: TextStyle(color: Get.isDarkMode ? whiteColor : mainColor)),
          onTap: () {
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
                cancelTextColor: Get.isDarkMode ? whiteColor : Colors.black,
                textConfirm: 'yes',
                confirmTextColor: Get.isDarkMode ? whiteColor : Colors.black,
                onCancel: () {
                  Get.back();
                },
                onConfirm: () {
                  controller.signOutFromApp();
                },
                buttonColor: Get.isDarkMode ? mainColor : mainColor);
          },
        ),
      ],
    );
  }
}
