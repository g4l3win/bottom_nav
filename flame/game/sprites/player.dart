import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/go_green_game.dart';

class Player extends SpriteComponent with HasGameRef<GoGreenGame> {
  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    sprite = await Sprite.load("smile.png");
    size = Vector2.all(100);
    position = Vector2(0, -(gameHeight/2)+(size.y/2));
    anchor = Anchor.topCenter;
    add(RectangleHitbox());
  }

  @override
  void update(double dt){//value pakai dt itu delta time kayak counter yang ngitung 1234 increase y by the value of that time
    super.update(dt);

    double newY=  position.y + (dt * 300);//dia bisa turun karena dt selalu bertambah kalau mau jatohnya tambah lama bisa diatur angka 400 nya dikurangin
    //bisa dicek posisi barunya di dalam batas screen kita
    if(newY >(gameRef.size.y/2)-(size.y/2)){
      newY = (gameRef.size.y/2)-(size.y/2);
    }
    position.y = newY;
  }

  void move(double deltaX){
    double newX = position.x + deltaX;
    //biar jatohnya enggak melebihi sisi kanan dan kiri dari layar
    double minX = -(gameRef.size.x/2 )+ size.x /2;
    double maxX = (gameRef.size.x/2) - size.x /2;
    newX = newX.clamp(minX, maxX);
    position.x = newX;
  }
//   Player({
//     required super.position,
//     required double radius,
//     Color color = Colors.white,
//
// }): super(
//     anchor: Anchor.center,
//     radius:radius,
//      paint: Paint()..color = color
//       ..style = PaintingStyle.fill,
//   );
}
