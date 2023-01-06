import 'package:boat_rent_project/view/screen/owner/drawer_owner.dart/drawer_setting.dart';
import 'package:flutter/material.dart';

import '../../auth/drawer/drawer-header/drawer_header.dart';

class DrawerOwnerBody extends StatefulWidget {
  const DrawerOwnerBody({super.key});

  @override
  State<DrawerOwnerBody> createState() => _DrawerOwnerBodyState();
}

class _DrawerOwnerBodyState extends State<DrawerOwnerBody> {
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
        DrawerSettingOwner(),
      ]),
    );
  }
}
