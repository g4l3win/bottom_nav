import 'package:get/get.dart';
import 'package:bottom_nav/modules/browse/controller/browse_controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrowseController());
  }
}