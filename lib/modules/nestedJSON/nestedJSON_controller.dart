import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bottom_nav/models/SekolahModel.dart';

class nestedJSON_controller extends GetxController {

  List<Map<String, dynamic>> sekolah = [
    {
      "namaSekolah": "Sekolah Dasar 1",
      "alamat": "Jl. Pendidikan No. 1, Jakarta",
      "tahunBerdiri": "1990",
      "kelas": [
        {
          "namaKelas": "Kelas 1A",
          "guru": "Bapak Ahmad",
          "siswa": [
            "Alya",
            "Budi"
          ]
        },
        {
          "namaKelas": "Kelas 1B",
          "guru": "Ibu Siti",
          "siswa": [
            "Citra",
            "Doni"
          ]
        }
      ]
    }
  ];
  List<modelSekolah> dataSiswaSekolah = List<modelSekolah>.empty(growable: true).obs;

  @override
  void onInit(){
    super.onInit();
    loadDataSekolahSiswa();
  }
  void loadDataSekolahSiswa (){
    for(int i = 0; i<sekolah.length; i++){
      String namaSekolah = sekolah[i]["namaSekolah"];
      List kelas = sekolah[i]["kelas"];
      for(int j = 0; j<kelas.length ; j++){
        var namaKelas = kelas[j]["namaKelas"];
        var guru = kelas[j]["guru"];
        List <String> siswa = kelas[j]["siswa"];
        
        dataSiswaSekolah.add(
            modelSekolah(namaSekolah, namaKelas, guru, siswa));
      }
    }
  }

}
