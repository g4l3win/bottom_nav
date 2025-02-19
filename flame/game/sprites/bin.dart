import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/go_green_game.dart';
import 'package:flame/game.dart';
import 'dart:async';

import 'package:inputkey/game/sprites/player.dart';

class Bin extends SpriteComponent with HasGameRef<GoGreenGame>, CollisionCallbacks {
  @override
  FutureOr<void> onLoad() async{
    sprite = await Sprite.load("settings.jpg");
    size = Vector2.all(300);
    position = Vector2(0, 660);
    anchor = Anchor.topCenter;
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other){
    //dicek juga center of the smile is the center of the settings
    if(other is Player && other.position.y > position.y){
      other.removeFromParent();
      //gameRef.pauseEngine();//hentikan game
      gameRef.gameOver();       // Panggil fungsi game over
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
