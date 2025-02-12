import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/LogIn/controller/LogIn_controller.dart';
import 'package:bottom_nav/navigation/routes.dart';

class LogInPage extends GetView<LogInController> {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Log in",
                style: TextStyle(color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),),
              TextField(
                decoration:InputDecoration(
                  label: Text("Username"),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration:InputDecoration(
                  label: Text("Password"),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(  onPressed: () {
                Get.toNamed(Routes.home); // Menavigasi ke halaman dengan nama rute 'home'
              },
                  child: Text("Log in")),

            ],
          ),
        ),
      ),
    );

  }
}
