import 'package:boat_rent_project/logic/Controller/boat_toatl_controller.dart';
import 'package:boat_rent_project/utils/theme/theme.dart';
import 'package:boat_rent_project/view/screen/payment_screens.dart';
import 'package:boat_rent_project/view/weidget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/row_text.dart';

class ConfirmScreens extends StatefulWidget {
  ConfirmScreens({Key? key}) : super(key: key);

  @override
  State<ConfirmScreens> createState() => _ConfirmScreensState();
}

class _ConfirmScreensState extends State<ConfirmScreens> {
  late int x = 1;

  final controller = Get.put(BoatTotalController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 680,
            color: Get.isDarkMode ? darkColor : Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RowText(
                  onIncrement: () {
                    setState(() {
                      controller.incrementAdult();
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      controller.decrementAdult();
                    });
                  },
                  text: "Adult".tr,
                  x: controller.adult,
                ),
                SizedBox(
                  height: 20,
                ),
                RowText(
                  onIncrement: () {
                    setState(() {
                      controller.incrementChild();
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      controller.decrementChild();
                    });
                  },
                  text: "SpecificChild".tr,
                  x: controller.child,
                ),
                SizedBox(
                  height: 20,
                ),
                RowText(
                  onIncrement: () {
                    setState(() {
                      controller.incrementKids();
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      controller.decrementKids();
                    });
                  },
                  text: "SpecificKids".tr,
                  x: controller.kids,
                ),
              ],
            ),
          ),
          Boat(
            total: controller.totalAdult(),
          )
        ],
      ),
    ));
  }
}

class Boat extends StatelessWidget {
  int? total;

  Boat({Key? key, required this.total}) : super(key: key);

  final controller = Get.put(BoatTotalController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoatTotalController>(
      builder: (controller) => Container(
        width: double.infinity,
        height: 120,
        color: Get.isDarkMode ? darkColor : Colors.blue.shade50,
        // alignment: Alignment.bottomCenter,

        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 140,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          text: "price".tr,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          textDecoration: TextDecoration.none),
                      TextUtils(
                          text: "$total${"Jd".tr}",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          textDecoration: TextDecoration.none),
                    ],
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Get.isDarkMode ? Colors.red : Colors.blue)),
                    onPressed: () {
                      Get.to(const CreditCard());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pay".tr),
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );

    // Your elements here
  }
}
