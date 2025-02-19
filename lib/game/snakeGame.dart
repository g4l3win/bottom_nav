import 'package:flame/game.dart';
import 'package:flame_ular/game/snakeGameWorld.dart';
import 'package:flame_ular/constants.dart';
import 'package:flame/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';


class snakeGame extends FlameGame<snakeGameWorld> {
  //kasih tahu kalau dunia game kit di snakeGameWorld di FlameGame<>
  snakeGame()
      : super(
      world: snakeGameWorld(),
      camera: CameraComponent.withFixedResolution(
          width: gameWidth, height: gameHeight)); //dapat dari constant

  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugMode = true;
  }

  @override
  Color backgroundColor() {
    return Colors.black12;
  }



}