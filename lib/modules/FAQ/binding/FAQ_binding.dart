import 'package:get/get.dart';
import 'package:bottom_nav/modules/FAQ/controller/FAQ_controller.dart';

class FAQBinding extends Bindings{
  //lazyput
  @override
  void dependencies() {
    Get.lazyPut<FAQController>(() => FAQController());
  }

}