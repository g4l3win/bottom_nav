import 'package:flame/components.dart';
//import 'package:flame/text.dart';
import 'package:flame/geometry.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flame_ular/game/snakeGame.dart';
import 'package:flame_ular/game/gridMap.dart';

class Ular extends RectangleComponent with HasGameRef<snakeGame>{
  final GridMap gridMap;
  List<Vector2> body = []; //menyimpan posisi badan ular

  Ular(this.gridMap){
    body.add(gridMap.getPosition(5,5));//position ular
    color = Colors.green;
  }

  void move(int dx, int dy){
    //ambil posisi kepala
    Vector2 head = body.first;
    Vector2 newPosition = gridMap.getPosition(
        (head.x / gridMap.cellSize).toInt() + dx,
        (head.y / gridMap.cellSize).toInt() + dy
      );
    //kayak masukkin insert newHead ke dalam listBody
    body.insert(0, newPosition);
    //hapus ekor biar keliatan kayak jalan
    body.removeLast();
  }

  @override
  void update(double dt){
    position = body.first;
  }
 //  Ular(Vector2 position):
 //      super(position: position,
 //      size: Vector2(30, 30),
 //  paint: Paint()..color = const Color(0xFF00FF00), // Warna hijau
 // );

}



///kalau mau nambah text begini
// class Ular extends TextComponent {
//   late TextComponent tulisan;
//   Ular({super.position}) :
//         super(size: Vector2.all(200), anchor: Anchor.center);
//
//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//    //teks place holder
//     tulisan = TextComponent(
//     text:"ini player ular",
//     textRenderer: TextPaint(
//       style: TextStyle(fontSize: 20),
//
//     )
//     );
//     add(tulisan);
//   }
// }

