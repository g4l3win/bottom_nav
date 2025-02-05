import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/settings/controller/settings_controller.dart';
import 'package:bottom_nav/navigation/routes.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: //Center(
          //child:
        Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('images/settings.jpg')
              ),
              Container(
                child: Text(Get.find<SettingsController>().title.value),
              ),
              // ElevatedButton(
              //   child: Text('Another Page'),
              //   onPressed: () => Get.toNamed(Routes.another),
              // ),
            ],
          ),
        ),

        //),
      ),
    );
  }
}