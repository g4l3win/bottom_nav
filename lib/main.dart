import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/home/pages/home_page.dart';
import 'modules/home/binding/home_binding.dart';
import 'modules/another/another_page.dart';
import 'navigation/pages.dart';

void main() {
  runApp(GetMaterialApp(
    //debug show checker mode ada di dalam material app
    debugShowCheckedModeBanner: false,
    title: 'state management',
    //theme data
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),),

    // initialRoute: '/home',
    // defaultTransition: Transition.fade, //keren bisa transisi. atur default
    // getPages: [
    //   GetPage(
    //     name: '/home',
    //     page: () => HomePage(),
    //     binding: HomeBinding(),
    //   ),
    //   GetPage(
    //     name: '/another',
    //     page: () => AnotherPage(),
    //   ),
    // ],

    initialRoute: AppPages.initial, //ambil dari route '/home'
    getPages: AppPages.routes,
  ));
}






