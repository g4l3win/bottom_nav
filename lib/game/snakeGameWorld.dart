import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'sprites/ular.dart';
import 'package:flame_ular/game/gridMap.dart';
import 'snakeGame.dart';
class snakeGameWorld extends World with HasGameRef<snakeGame>{
  late Ular ular;
  late GridMap gridMap;
  @override
  Future<void> onLoad() async {
    gridMap = GridMap(10, 10, gameRef.size.x/10);
    //so the world would linked up to our game
    ular = Ular(Vector2(0,0));
    add(ular);
  }
}