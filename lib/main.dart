import 'package:flutter/material.dart';
import 'package:get/get.dart';

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






