import 'package:bottom_nav/controllers/date_controller.dart';
import 'package:bottom_nav/controllers/text_controller.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/services/api_services.dart'; //dapat service ambil data API
import 'package:intl/intl.dart'; //dapat tanggal
import 'package:bottom_nav/models/ListData.dart'; //dapat model listdata
import 'dart:convert';

class BrowseController extends GetxController {
  //variabel buat handle multiple bindings yang text controller
  late TextController txtController;// untuk buat variabel text controller yang diinisialisasi
  //dikemudian waktu. seoalnya defaultnya yang browse controller dulu sih, jadi si text controllernya bakal dibuat variabelnya kalau udah dibuat inisialisasinya
  //variabel buat handle multiple bindings yang text controller
  late DateController dateController;
  //variabel API
  var apiService = ApiService();//list untuk dapat data List
  var documentData = ''.obs; // Gunakan obs agar bisa dipantau di UI
  var listDataAPI = <ListData>[].obs; //dapat list data dari API KARENA INI PAKAI .OBS jadinya harus di list tile waktu mau tampilin UI harus pakai Obx juga
  //Menandai data fetching atau tidak
  var isLoading = false.obs;

  @override
  void onInit() async{
    super.onInit();
    onInitialController();
    onGetAllDocumentData();
  }

  //fungsi untuk memeriksa apakah controller dengan tipe text controller sudah terdaftar
  //di dependency manager Get atau belom
  void onInitialController(){
    txtController = Get.isRegistered<TextController>() ? Get.find<TextController>() : Get.put(TextController());
    dateController = Get.isRegistered<DateController>() ? Get.find<DateController>() : Get.put(DateController());
    //if TextController sudah registered maka pakai Get.Find untuk dapat text controllernya
    //kalau belum terdaftar maka akan membuat instancenya
  }

  //onGEtAllDocumentData()
  onGetAllDocumentData() async {
    print('getting all data');
    try{
      isLoading.value=true;
      String url = "https://portal.mayora.co.id/MOA2/WMS/GetProductionOrder?username=MG109519";
      String result = await apiService
          .onBasicGetSource(url: url)
          .timeout(const Duration(seconds: 20), onTimeout: () => "Time Out");
      documentData.value = result;
      onFilterData(data: result);
      isLoading.value = false;
    } catch (e) {
      print('failed $e');
    }
  }
  void onFilterData({required String data}) {
    if (data.isNotEmpty &&
        !data.toLowerCase().contains('error') &&
        !data.toLowerCase().contains('failed')) {
      var jsonData = jsonDecode(data);
      listDataAPI.clear(); // Hapus data lama sebelum menambah data baru
      for (var material in jsonData) {
        listDataAPI.add(ListData.fromJson(material));
      }
    }
    print('length ${listDataAPI.length.toString()}');

  }



}