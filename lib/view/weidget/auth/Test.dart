import 'package:boat_rent_project/logic/Controller/boat_controller.dart';
import 'package:boat_rent_project/logic/model/boat_model.dart';
import 'package:boat_rent_project/utils/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/table_controller.dart';
import '../text_utils.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controller = Get.put(TableController());
  final controllers = Get.put(BoatController());

  int selectIndex = 0;
  String s = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(
      builder: (controller) => Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        child: SizedBox(
          height: 100,
          child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: controller.tableModel.length,
              //   crossAxisSpacing: 1,
              //   mainAxisSpacing: 2,
              //   childAspectRatio: 0.8,
              //
              //
              // ),
              scrollDirection: Axis.horizontal,
              itemCount: controller.tableModel.length,
              itemBuilder: (iteamBuilder, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      controllers.boatModel = [];
                      selectIndex = index;

                      controllers.COLLECTION_NAME =
                          controller.tableModel[index].name.toString();
                      s = controller.tableModel[index].name.toString();
                      controllers.collectionReference =
                          FirebaseFirestore.instance.collection(s);
                      controllers.getBoat();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 400,
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 5, right: 20),
                      decoration: BoxDecoration(
                          color:
                              selectIndex == index ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_boat_filled_outlined,
                            color: Get.isDarkMode ? whiteColor : Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextUtils(
                              text:
                                  controller.tableModel[index].name.toString(),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              textDecoration: TextDecoration.none),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
