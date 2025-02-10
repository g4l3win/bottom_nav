import 'package:get/get.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';

class HalempatBinding extends Bindings {
  //lazyput
  @override
  void dependencies() {
    Get.lazyPut<HalempatController>(() => HalempatController());
  }
}