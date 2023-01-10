import 'package:boat_rent_project/logic/model/boat_model.dart';
import 'package:boat_rent_project/view/screen/confrim_screens.dart';
import 'package:boat_rent_project/view/weidget/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/model/table_modle.dart';
import '../../utils/theme.dart';
import '../home/cart_toatle.dart';
import 'massge_screens.dart';

class CategoryScreens extends StatefulWidget {
  CategoryScreens({required this.model, required this.price, Key? key})
      : super(key: key);
  BoatModel model;
  BoatModel price;

  @override
  State<CategoryScreens> createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 600,
            child: Container(
              width: double.infinity,
              height: 400,
              color: Get.isDarkMode
                  ? darkColor
                  : const Color.fromARGB(255, 161, 182, 197),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: Image.network(
                      widget.model.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.model.name.toString(),
                      style: TextStyle(
                          color: Get.isDarkMode ? whiteColor : whiteColor)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.model.desc.toString(),
                      style: TextStyle(
                          color: Get.isDarkMode ? whiteColor : whiteColor)),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(
                            widget.model.image1.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(widget.model.image2.toString(),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(widget.model.image3.toString(),
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Get.isDarkMode
                ? darkColor
                : const Color.fromARGB(255, 161, 182, 197),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 84, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MaterialButton(
                    color: Get.isDarkMode ? Colors.red : mainColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SendMessage()));
                    },
                    child: Text("Massage".tr)),
                MaterialButton(
                    onPressed: () {
                      //  NavigationBar.pop
                      //Map<>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmScreens()));
                      // Get.to(ConfirmScreens());
                    },
                    color: Get.isDarkMode ? Colors.red : mainColor,
                    child: Text("Book Now".tr)),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
