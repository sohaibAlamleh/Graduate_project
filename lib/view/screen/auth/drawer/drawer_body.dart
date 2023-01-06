import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'drawer-header/drawer_header.dart';
import 'drawer-setting/drawer_setting.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({
    super.key,
  });

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: ListView(children: const [
        //*header
        DrawerHeader1(),

        //* divider
        Divider(
          height: 1,
          thickness: 2,
          //indent: 40,
          //endIndent: 40,
        ),

        //*Setting
        DrawerSetting(),
      ]),
    );
  }
}
