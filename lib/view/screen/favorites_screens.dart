import 'package:boat_rent_project/logic/model/boat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';

import '../../logic/Controller/boat_controller.dart';
import '../../utils/theme/theme.dart';

class FavoritesScreens extends StatefulWidget {
  const FavoritesScreens({Key? key}) : super(key: key);

  @override
  State<FavoritesScreens> createState() => _FavoritesScreensState();
}

class _FavoritesScreensState extends State<FavoritesScreens> {
  // final controller = Get.find<BoatController>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkColor : whiteColor,
      body: GetBuilder<BoatController>(builder: (controller) {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please,add your favourite",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                )
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildFavorites(
                image: controller.favoriteList[index].image.toString(),
                title: controller.favoriteList[index].name.toString(),
                desc: controller.favoriteList[index].desc.toString(),
                productId: controller.favoriteList[index].id.toString(),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favoriteList.length,
          );
        }
      }),
    );
  }

  Widget buildFavorites(
      {required String image,
      required String title,
      required String desc,
      required String productId}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $desc',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GetBuilder<BoatController>(
              builder: (controller) => IconButton(
                  onPressed: () {
                    setState(() {
                      controller.favoriteList.removeWhere(
                          (element) => element.name.toString() == productId);
                    });
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
