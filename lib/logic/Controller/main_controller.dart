import 'package:get/get.dart';

import '../../view/screen/category_screens.dart';
import '../../view/screen/favorites_screens.dart';
import '../../view/screen/home_screen.dart';
import '../../view/screen/setting_screen.dart';

class MainController extends GetxController {
  RxInt currnetIndex = 0.obs;

  final tabs = [HomeScreens(), FavoritesScreens(), SettingScreens()].obs;
  final title = ["Boat Rent", "Favorites", "Setting"].obs;
}
