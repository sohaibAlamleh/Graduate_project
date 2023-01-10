import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadioListTile(
          title: Text("Male".tr),
          value: "male".tr,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Female".tr),
          value: "female".tr,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
      ],
    );
  }
}
