import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/browse/binding/browse_binding.dart';
import 'package:bottom_nav/modules/browse/pages/browse_page.dart';
import 'package:bottom_nav/modules/settings/pages/settings_page.dart';
import 'package:bottom_nav/modules/settings/binding/settings_binding.dart';
class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/browse', '/settings'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/browse')
      return GetPageRoute(
        settings: settings,
        page: () => BrowsePage(),
        binding: BrowseBinding(),
      );
    if (settings.name == '/settings')
      return GetPageRoute(
        settings: settings,
        page: () => SettingsPage(),
        binding: SettingsBinding(),
      );


    return null;
  }
}