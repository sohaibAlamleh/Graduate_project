
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/theme.dart';
import '../weidget/auth/auth_image_asset.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
       backgroundColor: Get.isDarkMode? buttonColor:mainColor,
    body: Choose(),
    )
    );
  }
}


class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Get.isDarkMode?Image.asset('assets/images/splash.jpg')
            : Image.asset('assets/images/boat-logo.jpg'),
        const Padding(
          padding: EdgeInsets.all(20),
        ),
        const Center(
          child: Text(
            'Hello',
            style: TextStyle(
                color: whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'anton'),
          ),
        ),
        const SizedBox(height: 50),
        const Center(
          child: Text(
            'Choose Language',
            style: TextStyle(
              color: whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.offNamed(Routs.lognin_screens);
              },
              child: AuthImageAssets(
                  image: 'assets/images/aribic.png', width: 90, height: 80),
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () {Get.offNamed(Routs.lognin_screens);
              },
              child: AuthImageAssets(
                  image: 'assets/images/english.png', width: 100, height: 100),
            )
          ],
        )
      ],
    );
  }
}
