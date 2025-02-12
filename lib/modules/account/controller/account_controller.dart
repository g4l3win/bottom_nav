import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/controllers/text_controller.dart';
// enum Gender { lakiLaki, perempuan }
class AccountController extends GetxController {
  //cuma buat radio button
  var selectedGender = 'lakiLaki'.obs; // Obs untuk reactive state defaultnya laki-laki
  //dan reactive variabel tipe datanya tidak boleh null
  //late TextController txtController;// untuk buat variabel text controller yang diinisialisasi

  var nameController = TextEditingController(); //inisialisasi variabel nameController = dengan membuat instance objek TextController
//text editing controller adalah fungsi bawaan flutter DART untuk memberikan nilai awal pada TextField
  var emailController = TextEditingController();
  var birthdateController = TextEditingController();
  var phoneController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();

  void setSelected(String? value) {
    selectedGender.value = value ?? "-" ;
    //fungsi void setSelected String? artinya bisa menerima nilai null
    //tapi selectedGender.value merupakan Rx<String> dan tipe datanya tidak boleh error
    //kalau selectedGender tidak pakai .value artinya kita mau mengubah semua Rx<String> bukan isinya
  }

  //kalau enggak kosong return true
  bool validateFields() {
    //nameController.isNotEmpty tidak jalan karena nameController bukan variabel String tapi objek instansiasi dari TextEditingController
    //ditambah .text.isNotEmpty biar jadi string yang dapat check
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        birthdateController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty;
  }
}
  //template untuk controller masa yang akan datang aja
  // @override
  // void onInit() async{
  //   super.onInit();
  //   onInitialController();
  // }
  //
  // //fungsi untuk memeriksa apakah controller dengan tipe text controller sudah terdaftar
  // //di dependency manager Get atau belom
  // void onInitialController(){
  //   txtController = Get.isRegistered<TextController>() ? Get.find<TextController>() : Get.put(TextController());
  //   //if TextController sudah registered maka pakai Get.Find untuk dapat text controllernya
  //   //kalau belum terdaftar maka akan membuat instancenya
  // }
