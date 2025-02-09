import 'package:get/get.dart';
import 'package:bottom_nav/controllers/text_controller.dart';
enum Gender { lakiLaki, perempuan }

class AccountController extends GetxController {
  //variabel controler untuk setiap textbox karena setiap textfield nilai yang diambil beda-beda dan biar gampang validasi
  //texteditingcontroller itu fungsi bawaannya flutter
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var birthdateController = TextEditingController();
  var phoneController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  //cuma buat radio button
  var selectedGender =
      Gender.lakiLaki.obs; // Obs untuk reactive state defaultnya laki-laki
  //late TextController txtController;// untuk buat variabel text controller yang diinisialisasi

  void setSelected(Gender value) {
    selectedGender.value = value;
  }

  //validasi textbox controller. kalau semua text fieldnya enggak kosong hasilnya akan True
  bool validateFields() {
    //.text karena menyimpan value string yang diketik user
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        birthdateController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty;
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
