import 'package:boat_rent_project/logic/Controller/boat_toatl_controller.dart';
import 'package:boat_rent_project/utils/theme.dart';
import 'package:boat_rent_project/utils/theme/rate_app.dart';
import 'package:boat_rent_project/view/weidget/auth/Test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/Controller/boat_controller.dart';
import 'category_screens.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final controller = Get.put(BoatController());
  final cont = Get.put(BoatTotalController());

  @override
  Widget build(BuildContext context) {
    return
        //GetBuilder<BoatController>(
        //   builder: (controller) =>
        //controller.loding.value?
        //  Center(child: CircularProgressIndicator()):
        GetBuilder<BoatController>(
      builder: (controller) =>
          // controller.loding.value?
          //     Center(child: CircularProgressIndicator()):
          Scaffold(
              body: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(children: [
          const Test(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10), // <= No more error here :)
                    color: Get.isDarkMode ? darkColor : Colors.white,
                  ),
                  // color: Colors.blue.shade50,
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.separated(
                    itemCount: controller.boatModel.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Get.to(CategoryScreens(
                              model: controller.boatModel[index],
                              price: controller.boatModel[index],
                            ));
                            cont.priceAdult =
                                controller.boatModel[index].priceAdult;
                            cont.priceKids =
                                controller.boatModel[index].pricekid;
                            cont.priceChild =
                                controller.boatModel[index].priceChild;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.boatModel[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Get.isDarkMode
                                            ? whiteColor
                                            : Colors.grey),
                                  ),
                                ),
                                // ignore: prefer_const_constructors

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controller.manageFavorite(controller
                                          .boatModel[index].name
                                          .toString());
                                    });
                                  },
                                  icon: controller.isFavorite(controller
                                          .boatModel[index].name
                                          .toString())
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.black,
                                        ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Get.isDarkMode ? darkColor : mainColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.network(
                                  controller.boatModel[index].image.toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(controller.boatModel[index].desc.toString(),
                                maxLines: 2,
                                style: TextStyle(
                                    color: Get.isDarkMode
                                        ? whiteColor
                                        : Colors.grey,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  RareApp(),
                                ],
                              )),
                            ),
                            Container(
                              height: 10,
                              color: Get.isDarkMode ? darkColor : Colors.white,
                              width: double.infinity,
                            )
                          ],
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 20,
                        child: Container(
                          height: 100,
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ]),
      )),
    );
  }
}
