import 'package:get/get.dart';
import 'package:simple_app_android/modules/halEmpat/binding/halEmpat_binding.dart';
import 'package:simple_app_android/modules/halEmpat/controller/halEmpat_controller.dart';

class HalempatBinding extends Bindings {
  //lazyput
  @override
  void dependencies() {
    Get.lazyPut<HalempatController>(() => HalempatController());
  }
}
