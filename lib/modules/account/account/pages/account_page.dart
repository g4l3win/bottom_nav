import 'package:bottom_nav/modules/account/controller/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/header.dart';
import 'component/body.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Account')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Header(),
                //kubu body
                Body()

              ],
            ),
          ),
        ));
  }
}
