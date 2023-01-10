import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RareApp extends StatefulWidget {
  const RareApp({Key? key}) : super(key: key);

  @override
  State<RareApp> createState() => _RareAppState();
}

class _RareAppState extends State<RareApp> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      // ignore: prefer_const_constructors
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );

//double value = 0;
    // return RatingStars(
    //   value: value,
    //   onValueChanged: (v) {
    //     //
    //     setState(() {
    //       value = v;
    //     });
    //   },
    //   starBuilder: (index, color) => Icon(
    //     Icons.star,
    //     color: color,
    //   ),
    //   starCount: 5,
    //   starSize: 20,
    //   valueLabelColor: const Color(0xff9b9b9b),
    //   valueLabelTextStyle: const TextStyle(
    //       color: Colors.white,
    //       fontWeight: FontWeight.w400,
    //       fontStyle: FontStyle.normal,
    //       fontSize: 12.0),
    //   valueLabelRadius: 10,
    //   maxValue: 5,
    //   starSpacing: 2,
    //   maxValueVisibility: true,
    //   valueLabelVisibility: true,
    //   animationDuration: const Duration(milliseconds: 300),
    //   valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
    //   valueLabelMargin: const EdgeInsets.only(right: 8),
    //   starOffColor: const Color(0xffe7e8ea),
    //   starColor: Colors.yellow,
    // );
  }
}
