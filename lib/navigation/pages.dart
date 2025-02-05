import 'package:get/get.dart';
import 'package:bottom_nav/modules/home/pages/home_page.dart';
import 'package:bottom_nav/modules/home/binding/home_binding.dart';
import 'package:bottom_nav/modules/another/another_page.dart';
import 'package:bottom_nav/modules/browse/binding/browse_binding.dart';
import 'package:bottom_nav/modules/browse/pages/browse_page.dart';
import 'package:bottom_nav/modules/settings/binding/settings_binding.dart';
import 'package:bottom_nav/modules/settings/pages/settings_page.dart';
import 'routes.dart';

class AppPages{
  AppPages._();
  //menunjukkan rute awal. dapat rutenya dari routes.dart yang udah diimport
  static const initial = Routes.home;
  //static biar bisa akses tanpa harus buat instance objek
  //const untuk optimisasi performa karena nilai initialnya itu enggak berubah selama runtime jadi g disimpan dart selama compile


  static final routes = [
    GetPage(name: Routes.home, page: ()=> HomePage(), binding: HomeBinding()
    ),
    GetPage(name: Routes.another, page: ()=> AnotherPage()
    ),
    GetPage(name: Routes.browse, page: ()=> BrowsePage(), binding: BrowseBinding()
    ),
    GetPage(name: Routes.settings, page: ()=> SettingsPage(), binding: SettingsBinding()
    ),

  ];
}