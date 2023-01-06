
import 'package:boat_rent_project/logic/Controller/table_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/boat_controller.dart';



class BoatCategoryListItem extends StatelessWidget {
   BoatCategoryListItem({Key? key}) : super(key: key);
  final controller = Get.put(TableController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(
      builder: (controller)=> Container(
        height: 100,

        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
           CategoryListItem(
            categoryIcon:Icons.sailing,
            categoryName:"controller.",
            availability:3,
            selected:false,


           ), CategoryListItem(
              categoryIcon:Icons.sailing,
              categoryName:'Hot',
              availability:3,
              selected:false,


            )
          ],
        ),
      ),
    );
  }
}
class CategoryListItem extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

   CategoryListItem({
   required this.categoryIcon,
   required this.categoryName,
   required this.availability,
   required this.selected,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(
      builder: (controller) => Container(
        width: 70,



        margin: EdgeInsets.only(right: 15),

        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(50),
         color: selected ? Color(0xfffeb324) : Colors.white,
         border: Border.all(
           color: selected ? Colors.transparent : Colors.grey,
           width: 1.5,

         ),


        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:selected ? Colors.transparent:Colors.blueGrey
                   ,width: 1.5
                )
              ),
              child: Icon(categoryIcon,color: Colors.black  ,size: 15,),

            ),
            SizedBox(height: 10,),
            Text(categoryName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              width: 1.5,

              color: Colors.black26,
            ),
            Text(availability.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
              color: Colors.black
            ),)
          ],
        ),
      ),
    );
  }
}


// import 'package:boat_rent_project/logic/Controller/table_controller.dart';
// import 'package:boat_rent_project/logic/modle/boat_modle.dart';
// import 'package:boat_rent_project/logic/modle/table_modle.dart';
// import 'package:boat_rent_project/utils/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../logic/Controller/boat_controller.dart';


// class  BoatCategoryListItem extends StatefulWidget {
//
//   BoatCategoryListItem ({Key? key,}) : super(key: key);
//
//   @override
//   State<BoatCategoryListItem> createState() => _BoatCategoryListItemState();
// }
//
// class _BoatCategoryListItemState extends State<BoatCategoryListItem> {
//    List<String> name=[
//      "emad"
//
//
//    ];
//    late final TableModel model1;
//    final controller = Get.put(TableController());
//    final  Color color=Colors.grey.shade50;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:Iteam (
//      // model: model1,
//     )
//     );
//   }
// }
// class Iteam extends StatefulWidget {
//    Iteam({Key? key}) : super(key: key);
//
//
//   @override
//   State<Iteam> createState() => _IteamState();
// }
//
// class _IteamState extends State<Iteam> {
//   final controller = Get.put(TableController());
//   final cont = Get.put(BoatController());
//
//   //late  bool click;
//  //  late final  Color ? color;
//   //final Colors colors=[] as Colors;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TableController>(
//       builder: (controller)
//
//       => Container(
//         height: 120,
//         color: Colors.blue.shade50,
//         child: ListView.separated(
//           itemCount: controller.tableModel.length,
//           scrollDirection: Axis.horizontal,
//           itemBujilder: (context,index){
//             return Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 120,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Colors.white
//                     ),
//                     child: Column(
//                       children: [
//                         IconButton(
//
//                             onPressed: ()
//                         {
//                           setState(()
//                           {
//                             //cont.boatModel=<BoatModel>[].obs;
//                            // cont.getBoat();
//                            BoatController.COLLECTION_NAME=controller.tableModel[index].name.toString();
//                             print(controller.tableModel[index].name.toString());
//                           }
//                           );
//                         }, icon: Icon(Icons.directions_boat)),
//                         SizedBox(height: 5,),
//                         Text(controller.tableModel[index].name.toString())
//
//                       ],
//                     ),
//
//                   ),
//                 ],
//               ),
//             );
//           }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20,),),
//       ),
//     );;
//   }
// }
