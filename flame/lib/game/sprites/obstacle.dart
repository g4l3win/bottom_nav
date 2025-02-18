import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/go_green_game.dart';
import 'package:flame/game.dart';
import 'dart:async';

import 'package:inputkey/game/sprites/player.dart';

class Obstacle extends SpriteComponent with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    required Vector2 position,  //  Tambahkan posisi sebagai parameter
  }):super(position: position);
  final String spritePath;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    //position = Vector2(0, 0);
    anchor = Anchor.center;
    add(CircleHitbox());
  }
}

class ObstacleOne extends Obstacle{
  ObstacleOne(): super(spritePath: 'obstacle.png', position: Vector2(200, 200));
}

class Obstacletwo extends Obstacle{
  Obstacletwo(): super(spritePath: 'obstacle2.png', position: Vector2(-300, -400));
}

class ObstacleImage extends Obstacle{
  ObstacleImage(): super(spritePath: 'image1.jpg',position: Vector2(400,  -800));
}