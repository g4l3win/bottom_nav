import 'package:get/get.dart';
import 'package:bottom_nav/controllers/date_controller.dart';

class DateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateController>(() => DateController());
  }
}