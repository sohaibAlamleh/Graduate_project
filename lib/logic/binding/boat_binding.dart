import 'package:boat_rent_project/logic/Controller/table_controller.dart';
import 'package:get/get.dart';

import '../Controller/boat_controller.dart';

class BoatBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.lazyPut(() => BoatController());
    Get.lazyPut(() => TableController());
  }
}
