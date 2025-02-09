import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:simple_app_android/Data/product_data.json';
import 'package:simple_app_android/models/ProductModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart'; // Untuk load file
import 'package:simple_app_android/models/QuestionModel.dart';

class HalempatController extends GetxController {
  //list observable untuk product model
  var ProductData = <Productmodel>[].obs;
  //Menandai data fetching atau tidak
  var isLoading = false.obs;
  //metode bawaan GetX controler yang otomatis dijalankan saat controller diinisialisasi
  void onInit() {
    super.onInit();
    loadProductData(); // Panggil saat controller diinisialisasi
  }

  //buat load product data
  loadProductData() async {
    try {
      isLoading.value = true;
      String result = await loadAsset('assets/product_data.json');
      // documentData.value = result;
      onFilterData(data: result);
      isLoading.value = false;
    } catch (e) {
      print('failed $e');
    }
  }

  // Method untuk membaca file JSON dari assets
  Future<String> loadAsset(String path) async {
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
  void addItemToCart(int index) {
    //variabel terima data produk berdasarkan kelas Productmodel
    Productmodel product = ProductData[index];
    _cartItems.add(product);
    print("item sudah masuk ke cart : ${product.nama}");
  }

  //fungsi remove item dari cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index); //ini buat hapus item berdasarkan index
    print("item removed");
  }

  //fungsi calculate total belanja
  double calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += item.harga ??
          0; //kalau g null item harga akan ditambah sesuai iterasi kalau null ditambah 0
    }
    return total;
  }
}
