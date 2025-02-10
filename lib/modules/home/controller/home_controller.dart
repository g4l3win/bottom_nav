import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/navigation/routes.dart';
import 'package:bottom_nav/modules/browse/pages/browse_page.dart';
import 'package:bottom_nav/modules/settings/pages/settings_page.dart';
import 'package:bottom_nav/modules/halEmpat/pages/halEmpatPage.dart';
class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  List<String> dashboardPages = [Routes.browse, Routes.settings, Routes.halEmpat];

  //buat ganti halaman bottom navigation
  void changePage(int index) {
    print('tapped index ${index.toString()}');
    currentIndex.value = index;
    homePage(index);
     Get.toNamed(dashboardPages[index], id: index);

  }
  // Menampilkan halaman sesuai index. yang dikembalikan widget halaman sesuai index yang dipilih
  Widget homePage(int? index) {
    if (index == 1) {
      return SettingsPage();
    }else if(index ==2){
      return Halempatpage();
    }
    return BrowsePage(); // Default adalah index 0 (BrowsePage)
  }
}
  // Container homePage(int? index) {
  //   var home = Container(
  //     decoration: const BoxDecoration(
  //       color: Colors.blue
  //     ),
  //     child: Center(child: Text('this is ${dashboardPages.first}')),
  //   );
  //
  //   if(index != null && index != 0){
  //     home = Container(
  //       decoration: const BoxDecoration(
  //           color: Colors.green
  //       ),
  //       child: Center(child: Text('this is ${dashboardPages[index]}')),
  //     );
  //   }
  //   return home;
  // }


  // BELAJAR DARI KESALAHAN
// Route? onGenerateRoute(RouteSettings settings) {
  //   if (settings.name == '/browse')
  //     return GetPageRoute(
  //       settings: settings,
  //       page: () => BrowsePage(),
  //       binding: BrowseBinding(),
  //       bindings: [BrowseBinding(), BrowseBinding()]
  //     );
  //   if (settings.name == '/settings')
  //     return GetPageRoute(
  //       settings: settings,
  //       page: () => SettingsPage(),
  //       binding: SettingsBinding(),
  //     );
  //   return null;
  // }



