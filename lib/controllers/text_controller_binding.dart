import 'package:bottom_nav/controllers/text_controller.dart';
import 'package:get/get.dart';

class TextControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextController>(() => TextController());
  }
}