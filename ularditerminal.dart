import 'dart:async';
import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:ular/SnakeGame.dart';
// import 'gameUlar.dart';
//import 'dart:ffi';
import 'dart:io';

void main() {
  List<List<int>> ular = [
    [5, 4], // Kepala ular
    [5, 5], // Badan
  ];

 //  print(ular[0][0]); //keluar kiri atas
 // print(ular[0][1]);//keluar kanan atas
 // print(ular[1][0]);// keluar kiri bawah
//  print(ular[1][1]); //keluar kanan bawah

  List<int> arah = [0, -1]; // Mulai ke kanan
  bool isMain = true;
  int sumbuX = 10;
  int sumbuY = 10;
  List<int> makanan = [3, 5]; // Posisi awal makanan

  void drawGame(List<List<int>> ular, int sumbuX, int sumbuY) {
    for (int y = 0; y < sumbuY; y++) {
      for (int x = 0; x < sumbuX; x++) {
        // Cek apakah ada bagian ular di posisi (x, y)
        bool isUlar = ular.any((pos) => pos[0] == x && pos[1] == y);

        if (isUlar) {
          stdout.write('O'); // Gambar ular
        } else if (makanan[0] == x && makanan[1] == y) {
          stdout.write('X'); // Gambar makanan}
        } else {
          stdout.write('.'); // Gambar latar
        }
      }
      stdout.writeln(); // Pindah ke baris baru setelah satu row selesai
    }
  }

  void gerakUlar() {
    // Buat kepala baru berdasarkan arah
    List<int> kepala = [ular.first[0] + arah[0], ular.first[1] + arah[1]];

 //    print(ular[0].first);//luar kiri atas
 // print(ular[0].last); //keluar kanan atas
  
 // print("/n");
//  kepala = [ular[0].first,
//            ular[0].last
 //           ];

//      print(ular.first[0]); //ular dapat indeks ke satu indeks ke 0 sama kayak ular[0].first,
//  print(ular.first[1]); //dapat data pertama indeks [1,4] tapi karena fisrt[1] jadi diapat data 4 sama kayak ular[0].last

    // Jika keluar batas, teleportasi ke sisi lain
    if (kepala[0] >= sumbuX) kepala[0] = 0;
    if (kepala[0] < 0) kepala[0] = sumbuX - 1;
    if (kepala[1] >= sumbuY) kepala[1] = 0;
    if (kepala[1] < 0) kepala[1] = sumbuY - 1;

    // Cek apakah menabrak badan sendiri
    if (ular.any((pos) => pos[0] == kepala[0] && pos[1] == kepala[1])) {
      isMain = false;
      return;
    }

    // Masukkan kepala baru
    ular.insert(0, kepala);

    // Jika makan makanan, jangan hapus ekor
    if (kepala[0] == makanan[0] && kepala[1] == makanan[1]) {
      Random random = Random();
      makanan = [random.nextInt(sumbuX), random.nextInt(sumbuY)];
    } else {
      ular.removeLast(); // Hapus ekor
    }
  }

  Timer.periodic(Duration(milliseconds: 600), (timer) {
    // print('\x1B[2J\x1B[0;0H');
    drawGame(ular, sumbuX, sumbuY);
    gerakUlar();
  });
}
