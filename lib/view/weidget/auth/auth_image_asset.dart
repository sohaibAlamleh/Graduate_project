import 'package:flutter/material.dart';

class AuthImageAssets extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  AuthImageAssets(
      {required this.image,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        image,
        width: width,
        height: height,
      ),
    );
  }
}
