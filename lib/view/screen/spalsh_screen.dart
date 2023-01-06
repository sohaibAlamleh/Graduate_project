import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import 'choose_language.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),navigatetohome);
  }

 void navigatetohome()  {

    Navigator.pushAndRemoveUntil(
    context,
     MaterialPageRoute(builder: (context)=> ChooseLanguage()),
        (Route<dynamic>route )=>false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
              child:Get.isDarkMode?Image.asset('assets/images/splash.jpg')
             : Image.asset('assets/images/boat-logo.jpg')

          )
          ,
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),//     primaryColor: mainColor,
    );
  }
}
