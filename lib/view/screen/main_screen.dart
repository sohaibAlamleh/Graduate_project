import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/Controller/main_controller.dart';
import '../../utils/theme/theme.dart';
import 'auth/drawer/drawer_body.dart';
import 'favorites_screens.dart';

class MainScreens extends StatelessWidget {
  MainScreens({Key? key}) : super(key: key);
  final controller = Get.put(MainController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: context.theme.backgroundColor,
        drawer: const DrawerBody(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.segment,
              size: 30,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoritesScreens()));
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ))
          ],
          title: Text(
            controller.title[controller.currnetIndex.value],
            style: TextStyle(
              color: Get.isDarkMode ? whiteColor : Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 10,
          //leading:

          //   //   Badge(
          //   //   position: BadgePosition.topEnd(top: 0, end: 3),
          //   //   animationDuration: Duration(milliseconds: 300),
          //   //   animationType: BadgeAnimationType.slide,
          //   //   badgeContent: Text(
          //   //     '0',
          //   //     style: TextStyle(color: Colors.white),
          //   //   ),
          //   //   child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          //   // ) // IconButton(
          //   //   onPressed: (){
          //   //    Get.toNamed(Routs.cart_screens);
          //   //   },
          //   //   icon: Image.asset('assets/images/shop.png'))
          // ],
          // title: Text(controller.title[controller.currnetIndex.value]),
          // centerTitle: true,
          // backgroundColor: Get.isDarkMode ? buttonColor : mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkColor : mainColor,
          currentIndex: controller.currnetIndex.value,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.directions_boat,
                color: Get.isDarkMode ? mainColor : Colors.grey.shade400,
              ),
              icon: Icon(
                Icons.directions_boat_filled_outlined,
                color: Get.isDarkMode ? Colors.white : Colors.white,
              ),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   activeIcon: Icon(
            //     Icons.category,
            //     color: Get.isDarkMode ?  buttonColor: mainColor,
            //   ),
            //   icon:Icon(
            //     Icons.category,
            //     color: Get.isDarkMode ? Colors.white: Colors.black,),
            //   label: '',
            //
            //
            // ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? mainColor : Colors.grey.shade400,
              ),
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Get.isDarkMode ? whiteColor : Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? mainColor : Colors.grey.shade400,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.white,
              ),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currnetIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currnetIndex.value,
          // ignore: invalid_use_of_protected_member
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
