import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/models/ProductModel.dart';
import 'dart:convert'; //untuk conversi data pakai JSONDECODE
import 'package:flutter/services.dart'; //untuk pakai rootBundle

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
  Future<String>loadAsset(String path) async
  {
    //rootBunlde adalah bagian package services.dart yang dipakai untuk akses file dalam folder assets/
    //rootBundle bisa baca teks JSON TXT CSV
    //memuat file konfigurasi tanpa HTTP request
    //ambil data statis tanpa simpan ke database
    //rootBundle itu operasi asinkron lebih baik dimasukkan ke fungsi Future
    return await
    rootBundle.loadString(path);
    //referensi stackoverflow rootBundle https://stackoverflow.com/questions/51609421/how-to-use-rootbundle-in-flutter-to-load-images
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
    cartItems.add(ProductData[index]);
    print("sudah masuk ke cart item ${[ProductData[index].nama]}");
  }

  //fungsi delete/remove item dari cart
  void removeItemCart(int index) {
    cartItems.removeAt(index);
    print("item ${ProductData[index]}");
  }

  //fungsi calculate total belanja
  String calculateTotal() {
    int total = 0;
    for (var material in cartItems) {
      total += material.harga ?? 0;
    }
    return addTitik(total);
  }

  //fungsi buat sorting nama alfabet ascending
  void sortingNama() {
    //sorting kalau objek katanya
    ProductData.sort((a, b) => (a.nama ?? '-').compareTo(b.nama ?? '-'));
    // for ( var material in ProductData){
    //   print('${material.nama}');
    // }
  }

  void sortingNamaDes() {
    //sorting kalau objek
    //fungsi compareTo itu fungsi bawaan dart untuk membandingkan 2 nilai
    ProductData.sort((a, b) => (b.nama ?? '-').compareTo(a.nama ?? '-'));
    // for (var material in ProductData){
    //   print('${material.nama}');
    // }
  }

//   print('apple'.compareTo('banana'));  // Output: -1 (karena 'apple' < 'banana')
//   print('orange'.compareTo('grape'));  // Output: 1 (karena 'orange' > 'grape')
//   print('mango'.compareTo('mango'));   // Output: 0 (karena sama)
//
//   //kalau yang kiri dicompareTo diAlphabet lebih didepan dibalikkin nilainya -1
//   //kalau yang di dalam argumen compareTo lebih dibelakang dibalikkin nilainya 1
//   //kalau yang dicompare kiri dan kanan depannya hurufnya sama dibalikkin nilai 0
  void sortingHargaAs() {
    ProductData.sort((a, b) => (a.harga ?? 0).compareTo(b.harga ?? 0));
    // for (var material in ProductData) {
    //   print('${material.harga}');
    // }
  }

  void sortingHargaDes() {
    ProductData.sort((a, b) => (b.harga ?? 0).compareTo(a.harga ?? 0));
  }

//fungsi buat bikin harga ada titiknya tiap 3 angka 0
  //tipe data yang harus dikembalikan string buat Numberformat
  String addTitik(int number) {
    var f = NumberFormat("#,###", "id_ID");
    return f.format(number) ?? "0";
 }
}
