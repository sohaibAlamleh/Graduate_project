
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../weidget/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  //final controller=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: 'Total',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  textDecoration: TextDecoration.none),
              Text(
                '2 ',
                style: TextStyle(
                    color:Get.isDarkMode?Colors.white: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      elevation: 0,
                      primary:Get.isDarkMode ?darkColor: mainColor
                  ),
                  onPressed: (){

                  },
                  child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.shopping_cart)
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
