import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageConfirm extends StatelessWidget {
  const MessageConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Confirm'.tr),
          content: Text('message is send'.tr),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'.tr),
              child: Text('OK'.tr),
            ),
          ],
        ),
      ),
      child: const Text(''),
    );
  }
}
