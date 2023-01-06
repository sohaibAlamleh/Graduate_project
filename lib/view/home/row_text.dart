import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../weidget/text_utils.dart';

class RowText extends StatelessWidget {
  final Function() onIncrement;
  final Function() onDecrement;
  final String text;
  final  int x;
  RowText({
    Key? key,
    required this.onIncrement,
    required this.onDecrement,
    required this.text,
    required this.x
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            SizedBox(
              width: 120,
              child: TextUtils(
                  text: text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textDecoration: TextDecoration.none),
            ),
            SizedBox(width: 10,),
            IconButton(

              icon: Icon(
                Icons.remove_circle,
                color: Get.isDarkMode? Colors.white:Colors.black ,
              ),
              onPressed: onDecrement,),
            Text(
               "$x ",
                style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                )),
            IconButton(
                onPressed: onIncrement,
                icon: Icon(
                  Icons.add_circle,
                  color: Get.isDarkMode? Colors.white:Colors.black ,))

          ],

        ),
      ],
    );
  }
}