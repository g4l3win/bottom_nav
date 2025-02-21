import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flame_ular/game/snakeGame.dart';

class makanan extends PositionComponent with HasGameRef<snakeGame> {
  final int gridSize;
  final double cellSize;
  Random random = Random();

  makanan(this.gridSize, this.cellSize);

  void spawn(List<Vector2> snakeBody) {
    if(gameRef.isRemoved) {print("woir");}
    else{
      Vector2 newPosition;
      do { //pakai to double soalnya si Vector2 enggak terima tipe data int
        //biar enggak randomnya mepet sama tepi grid dirandom dari angka 1 - 18 aja
        newPosition = Vector2((random.nextInt(18)+1).toDouble(), (random.nextInt(18)+1).toDouble());
      } while (snakeBody.contains(newPosition)); //lakukan randomisasi posisi dari makanan selama si makanan masih ditemukan di dalam badan ular
      //harapannya biar posisi makanan enggak bentrok sama badan ular
      position =  newPosition;
      print("${position.x},${position.y}");
    }

  }

  // @override
  // void render(Canvas canvas) {
  //   final paint = Paint()..color = Colors.red;
  //   canvas.drawRect(
  //     Rect.fromLTWH(position.x*cellSize , position.y*cellSize, cellSize, cellSize),
  //     paint,
  //   );
  // }


//offset representasi koordinat 2D bentuk x,y di dalam canvas
  //buat gambar lingkaran di dalam canvas flame flutter harus pakai koordinat offset
  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.red;

    // Hitung pusat lingkaran. pusat lingkarannya tetep pakai koordinat (x,y)
    double centerX = (position.x * cellSize);
    double centerY = (position.y * cellSize);
    double radius = cellSize / 3; // Atur radius agar lebih kecil dari cell

    // Gambar lingkaran sebagai makanan
    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

}
// final GridMap gridMap;
// Random random = Random();
// int min = -9;
// int max = 9;
// Vector2 foodLocation = Vector2.zero();
// makanan(this.gridMap){
//   size = Vector2(20, 20);
//   foodLocation.add(gridMap.getPosition(random.nextInt(10), random.nextInt(10)));
//   paint= Paint()..color = const Color(0xFFFF0000); // Warna merah
//   add(RectangleHitbox());
// }
//
// //fungsi spawn makanan
// void spawnFood() {
//   int foodX = random.nextInt((max - min) + 1) + min; // Random posisi X dalam grid 10x10
//   int foodY = random.nextInt((max - min) + 1) + min; // Random posisi Y dalam grid 10x10
//   foodLocation = gridMap.getPosition(foodX, foodY); // Konversi ke posisi layar
//   position = foodLocation; // Atur posisi komponen
// }