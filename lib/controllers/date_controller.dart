import 'package:get/get.dart';
import 'package:intl/intl.dart';


class DateController extends GetxController {
  // Fungsi untuk mendapatkan tanggal yang diformat
  String getFormattedDate() {
    final now = DateTime.now();
    return DateFormat('d MMMM yyyy').format(now);
  }

}
