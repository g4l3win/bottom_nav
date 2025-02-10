import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/settings/controller/settings_controller.dart';
import 'package:bottom_nav/navigation/routes.dart';
import 'package:bottom_nav/modules/util/button.dart';
import 'package:bottom_nav/modules/settings/pages/component/icon_setting.dart';


class SettingsPage extends GetView<SettingsController> {
  //final SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Image.asset('images/settings.jpg'),
                height: 200,
              ),
              SizedBox(
                height: 15,
              ),
              //container biru memenuhi bagian bawah
              Container(
                padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.blue, // Warna background container
                  // borderRadius:
                  //     BorderRadius.circular(20), // Menambahkan border rounded ini kalau mau semuanya
                  //border radius only
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),  // Menambahkan rounded corner di kiri atas
                    topRight: Radius.circular(20), // Menambahkan rounded corner di kanan atas
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      Get.find<SettingsController>().title.value,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //button ke halaman lain panggil kelas button
                    //button ke halaman account
                    Button(
                        icon: Icons.account_circle_rounded,
                        label: 'Account',
                        rute: Routes.account),
                    //button ke halaman FAQ
                    Button(
                        icon: Icons.question_mark,
                        label: 'FAQ',
                        rute: Routes.FAQ),
                    Button(
                        icon: Icons.four_k,
                        label: 'halaman 4',
                        rute: Routes.halEmpat),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Hubungi customer support",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Kami siap 24 jam membantumu",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //facebook
                      IconSetting(icon: Icons.facebook, tulisan: "Facebook"),
                      //email
                      IconSetting(icon: Icons.email, tulisan: "Email"),
                      //telepon
                      IconSetting(icon: Icons.call, tulisan: "Telephone")
                    ],
                  )
                ],
              ))
            ]),
      ),
    );
  }
}
