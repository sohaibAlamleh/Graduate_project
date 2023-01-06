import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boat_rent_project/routes/routes.dart';
import 'package:boat_rent_project/utils/theme.dart';
import 'package:boat_rent_project/view/screen/choose_language.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logic/Controller/theams_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return GetMaterialApp(
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemesApp.light,
              darkTheme: ThemesApp.dark,
              themeMode: ThemeController().themeDataGet,
              home: AnimatedSplashScreen(
                splash: 'assets/images/boat-logo.jpg',
                nextScreen: const ChooseLanguage(),
                splashTransition: SplashTransition.rotationTransition,
                //   pageTransitionType: PageTransitionType.scale,
              ),
              initialRoute: FirebaseAuth.instance.currentUser != null ||
                      GetStorage().read<bool>("auth") == true
                  ? AppRoutes.main
                  : AppRoutes.splash,
              getPages: AppRoutes.routes,
            ));
  }
}
