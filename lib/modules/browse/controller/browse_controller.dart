import 'package:get/get.dart';
import 'package:bottom_nav/services/api_services.dart'; //dapat service ambil data API
import 'package:intl/intl.dart'; //dapat tanggal
import 'package:bottom_nav/models/ListData.dart'; //dapat model listdata
import 'dart:convert';

class BrowseController extends GetxController {
  final title = 'Browser'.obs;

  //variabel API
  var apiService = ApiService();//list untuk dapat data List
  var documentData = ''.obs; // Gunakan obs agar bisa dipantau di UI
  var listDataAPI = <ListData>[].obs; //dapat list data dari API KARENA INI PAKAI .OBS jadinya harus di list tile waktu mau tampilin UI harus pakai Obx juga
  //Menandai data fetching atau tidak
  var isLoading = false.obs;

  @override
  void onInit() async{
    super.onInit();
    onGetAllDocumentData();
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

// Fungsi untuk mendapatkan tanggal yang diformat
  String getFormattedDate() {
    final now = DateTime.now();
    return DateFormat('d MMMM yyyy').format(now);
  }

}