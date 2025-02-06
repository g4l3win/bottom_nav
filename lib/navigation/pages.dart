import 'package:get/get.dart';
import 'package:bottom_nav/modules/home/pages/home_page.dart';
import 'package:bottom_nav/modules/home/binding/home_binding.dart';
import 'package:bottom_nav/modules/account/pages/account_page.dart';
import 'package:bottom_nav/modules/browse/binding/browse_binding.dart';
import 'package:bottom_nav/modules/browse/pages/browse_page.dart';
import 'package:bottom_nav/modules/settings/binding/settings_binding.dart';
import 'package:bottom_nav/modules/settings/pages/settings_page.dart';
import 'package:bottom_nav/controllers/text_controller_binding.dart';
import 'package:bottom_nav/controllers/date_binding.dart';
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
    GetPage(name: Routes.account, page: ()=> AccountPage()
    ),
    GetPage(name: Routes.browse, page: ()=> BrowsePage(), bindings: [BrowseBinding(), TextControllerBinding(), DateBinding()]
    ),
    GetPage(name: Routes.settings, page: ()=> SettingsPage(), binding: SettingsBinding()
    ),

  ];
}