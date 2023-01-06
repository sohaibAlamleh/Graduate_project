import 'dart:io';

import 'package:boat_rent_project/logic/model/image.dart';
import 'package:boat_rent_project/utils/theme/theme.dart';
import 'package:boat_rent_project/view/screen/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerHeader1 extends StatefulWidget {
  const DrawerHeader1({
    super.key,
  });

  @override
  State<DrawerHeader1> createState() => _DrawerHeader1State();
}

class _DrawerHeader1State extends State<DrawerHeader1> {
  @override
  void initState() {
    super.initState();
    // uploadImage1();
    getImage();
    // GetImage m = GetImage();
    // m.s = image!;
  }

  //  void uploadImage1() {
  //   Firebase auth = .instance;
  // }

  File? img;
  String? image;
  final imagepicked = ImagePicker();

  uploadImage() async {
    // ignore: deprecated_member_use
    var pickedImage = await imagepicked.getImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      saveImage(pickedImage.path.toString());

      //save image to shared preferences

      setState(() {
        image = File(pickedImage.path.toString()).path;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return //*header
        SafeArea(
      bottom: false,
      child: Row(
        //* sizedBox height 4dp

        children: [
          //* image profile
          SizedBox(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () {
                  uploadImage();

                  // Navigator.of(context).push(MaterialPageRoute(
                },
                child: ClipOval(
                  child: image != null
                      ? Image.file(
                          File(image!),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/download (2).png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  FirebaseAuth.instance.currentUser != null
                      ? FirebaseAuth.instance.currentUser!.displayName!
                      : 'user name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? whiteColor : mainColor,
                  )),
              Text(
                FirebaseAuth.instance.currentUser != null
                    ? FirebaseAuth.instance.currentUser!.email!
                    : 'user email',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Get.isDarkMode ? whiteColor : mainColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void saveImage(String img) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('image', img);
    getImage();
  }

  void getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString('image');
    });

/*

    void removeImage() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('image');
      getImage();
      setState(() {});
    }
*/
  }
}
