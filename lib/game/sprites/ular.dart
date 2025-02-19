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
  Ular(Vector2 position):
      super(position: position,
      size: Vector2(30, 30),
  paint: Paint()..color = const Color(0xFF00FF00), // Warna hijau
 );

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

