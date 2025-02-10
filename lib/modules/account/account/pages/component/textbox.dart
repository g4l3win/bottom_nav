import 'package:flutter/material.dart';
import 'package:bottom_nav/modules/account/controller/account_controller.dart';
import 'package:get/get.dart';

class Textbox extends GetView<AccountController> {
  final String label;
  final TextEditingController ctrl;
  const Textbox({Key? key,
  required this.label, required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)
      ),
      child: TextField(
        controller: ctrl,
        //controller: controller.txtController.textEditingController.value,
        decoration: InputDecoration(
        labelText: label,

      ),),
    );
  }
}
