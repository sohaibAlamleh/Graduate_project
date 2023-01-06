import 'package:boat_rent_project/view/screen/owner/ownerhome_screen.dart';
import 'package:get/get.dart';

import '../logic/binding/auth_binding.dart';
import '../logic/binding/boat_binding.dart';
import '../logic/binding/main_binding.dart';
import '../view/screen/auth/foreget_passwored_screens_auth.dart';
import '../view/screen/auth/login_screen_auth.dart';
import '../view/screen/auth/signup_screens_auth.dart';
import '../view/screen/category_screens.dart';
import '../view/screen/choose_language.dart';
import '../view/screen/main_screen.dart';
import '../view/screen/spalsh_screen.dart';

class AppRoutes {
  static const welcome = Routs.welcome_screens;
  static const splash = Routs.Splash_screens;
  static const login = Routs.lognin_screens;
  static const sign = Routs.signup_screens;
  static const forget = Routs.forget_poasswored_screens;
  static const main = Routs.main_screens;
  static const chang = Routs.choose_language;
  static const ownerHomeScreen = Routs.OwnerHomeScreen;

  // static final routes=[
  //   GetPage(
  //       name: Routs.welcome_screens,
  //       page: ()=> WelcomeScreens()
  //   ),
  //   GetPage(
  //       name: Routs.lognin_screens,
  //       page: ()=> LoginScreen(),
  //       binding: AuthBinding()
  //
  //   ),
  //   GetPage(
  //       name: Routs.signup_screens,
  //       page: ()=> SignUpScreens(),
  //        binding: AuthBinding()
  //   ),
  //   GetPage(
  //       name: Routs.forget_poasswored_screens,
  //       page: ()=> ForgetPasswordScreens(),
  //        binding: AuthBinding()
  //   ),
  //   GetPage(
  //       name: Routs.main_screens,
  //       page: ()=> MainScreen(),
  //        bindings: [
  //          AuthBinding(),
  //          MainBinding(),
  //          ProductBinding()
  //        ]
  //   ),
  //   GetPage(
  //       name: Routs.cart_screens,
  //       page: ()=> CartScreen(),
  //       bindings:[
  //         AuthBinding(),
  //         ProductBinding()
  //         ]
  //       )
  //
  // ];

  static final routes = [
    GetPage(
      name: Routs.Splash_screens,
      page: () => Splash(),
    ),
    GetPage(
      name: Routs.choose_language,
      page: () => ChooseLanguage(),
    ),
    GetPage(
        name: Routs.lognin_screens,
        page: () => const LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routs.signup_screens,
        page: () => SignUpScreens(),
        binding: AuthBinding()),
    GetPage(
        name: Routs.forget_poasswored_screens,
        page: () => ForgetPasswordScreens(),
        binding: AuthBinding()),
    GetPage(
        name: Routs.OwnerHomeScreen,
        page: () => OwnerHomeScreen(),
        binding: AuthBinding()),
    // GetPage(
    //     name: Routs.category_screens,
    //     page: () => CategoryScreens(),
    //     binding: AuthBinding()),
    GetPage(
        name: Routs.main_screens,
        page: () => MainScreens(),
        bindings: [AuthBinding(), MainBinding(), BoatBinding()]),
  ];
}

class Routs {
  static const welcome_screens = '/welcomeScreens';
  static const Splash_screens = '/Splash';
  static const choose_language = '/ChooseLanguage';

  static const lognin_screens = '/LoginScreen';
  static const signup_screens = '/SignUpScreens';
  static const forget_poasswored_screens = '/forgetpasswordscreens';
  static const main_screens = '/MainScreens';
  static const category_screens = '/CategoryScreens';
  static const OwnerHomeScreen = '/OwnerHomeScreen';
}
