import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextController extends GetxController {
  var textEditingController = TextEditingController().obs; // Reactive controller for TextEditingController

  @override
  void onClose() {
    textEditingController.value.dispose(); // Dispose controller when not needed
    super.onClose();
  }
}