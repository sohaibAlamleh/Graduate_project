import 'package:flutter/material.dart';

// const Color mainColor = Color(0xff00BE84);
// const Color darkGreyClr = Color(0xFF121212);
// const Color pinkClr = Color(0xFFff4667);
// const Color kCOlor1 = Color(0xff685959);
// const Color kCOlor2 = Color(0xffADA79B);
// const Color kCOlor3 = Color(0xffA5947F);
// const Color kCOlor4 = Color(0xff738B71);
// const Color kCOlor5 = Color(0xff6D454D);
// const Color darkSettings = Color(0xff6132e4);
// const Color accountSettings = Color(0xff73bc65);
// const Color logOutSettings = Color(0xff5f95ef);
// const Color notiSettings = Color(0xffdf5862);
// const Color languageSettings = Color(0xffCB256C);
const Color mainColor = Color(0xff0099F5);
const Color darkColor = Color.fromARGB(255, 64, 62, 62);

const Color whiteColor = Color(0xfff8f5f5);
const Color buttonColor = Color(0xffba0dea);

//

// class ThemesApp {
//   static final light = ThemeData(
//     primaryColor: mainColor,
//     backgroundColor: Colors.white,
//     brightness: Brightness.light,
//   );
//

class ThemesApp {
  static final light = ThemeData(
      primaryColor: mainColor,
      backgroundColor: Colors.white,
      brightness: Brightness.light);
  static final dark = ThemeData(
      primaryColor: buttonColor,
      backgroundColor: buttonColor,
      brightness: Brightness.dark);
}
