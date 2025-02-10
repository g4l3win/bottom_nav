import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/models/ProductModel.dart';
import 'dart:convert';//untuk conversi data pakai JSONDECODE
import 'package:flutter/services.dart';

class HalempatController extends GetxController {
//list observable untuk product model
  var ProductData = <Productmodel>[].obs;
  //list observabel untuk menerima list data masuk cart
  var cartItems = <Productmodel>[].obs;
  //Menandai data fetching atau tidak
  var isLoading = false.obs;
  //metode bawaan GetX controler yang otomatis dijalankan saat controller diinisialisasi
  void onInit() {
    super.onInit();
    loadProductData(); // Panggil saat controller diinisialisasi
  }
  //loadProductData untuk load data produk cobain dari asset data JSON yang masukkin internal
  loadProductData() async {
    try {
      isLoading.value = true;
      String result = await loadAsset('assets/product_data.json');
      onFilterData(data: result);
      isLoading.value = false;
    } catch (e) {
      print('failed $e');
    }
  }

  //fungsi membaca file JSON dari assets pakai future dan async karena mendapatkan datanya harus menunggu
  Future<String> loadAsset(String path) async {
    //rootBunlde adalah bagian package services.dart yang dipakai untuk akses file dalam folder assets/
    //rootBundle bisa baca teks JSON TXT CSV
    //memuat file konfigurasi tanpa HTTP request
    //ambil data statis tanpa simpan ke database
    return await rootBundle.loadString(path);
  }
  void onFilterData({required String data}) {
    if (data.isNotEmpty &&
        !data.toLowerCase().contains('error') &&
        !data.toLowerCase().contains('failed')) {
      var jsonData = jsonDecode(data);
      ProductData.clear(); // Hapus data lama sebelum menambah data baru
      for (var material in jsonData) {
        ProductData.add(Productmodel.fromJson(material));
      }
    }
    print('length ${ProductData.length.toString()}');
  }
  //fungsi add item to cart
  void addItemToCart(int index){
    cartItems.add(ProductData[index]);
    print("sudah masuk ke cart item ${[ProductData[index].nama]}");
  }
  //fungsi delete/remove item dari cart
  void removeItemCart(int index){
    cartItems.removeAt(index);
    print("item ${ProductData[index]}");
  }
  //fungsi calculate total belanja
  double calculateTotal (){
    double total = 0;
    for(var material in cartItems){
      total += material.harga ?? 0;
    }
    return total;
  }
}
