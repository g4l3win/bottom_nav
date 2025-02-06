import 'package:get/get.dart';
import 'package:bottom_nav/controllers/text_controller.dart';
enum Gender { lakiLaki, perempuan }
class AccountController extends GetxController{
  //cuma buat radio button
  var selectedGender = Gender.lakiLaki.obs; // Obs untuk reactive state defaultnya laki-laki
  //late TextController txtController;// untuk buat variabel text controller yang diinisialisasi

  void setSelected(Gender value){
    selectedGender.value = value;
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
}