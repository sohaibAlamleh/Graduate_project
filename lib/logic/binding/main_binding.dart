import 'package:get/get.dart';

import '../../view/screen/main_screen.dart';
import '../Controller/boat_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(MainScreens());
    Get.lazyPut(() => BoatController());
  }
}
