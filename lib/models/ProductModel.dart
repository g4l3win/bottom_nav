import 'package:flutter/material.dart';
import 'dart:convert';

class Productmodel {
  String? imagepath; // ini bisa null variabelnya
  String? nama;
  int? harga;

  //constructor
  Productmodel(
      {required this.imagepath, required this.nama, required this.harga});

  Productmodel.fromJson(Map<String, dynamic> json) {
    imagepath = json['imagePath'] ?? "-";
    nama = json['nama'] ?? "-";
    harga = json['harga'] ?? 0;
  }
}
