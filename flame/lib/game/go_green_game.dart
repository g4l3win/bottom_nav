import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/go_green_world.dart';
import 'package:inputkey/game/sprites/player.dart';
import 'go_green_world.dart';
//key event and drag are happening on the game as a whole so the game itself determine what key are pressed to the game
class GoGreenGame extends FlameGame<GoGreenWorld> with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection{
  //kasih tahu kalau dunia game kit di GoGreenWorld di FlameGame<>
  GoGreenGame() :super(
      world: GoGreenWorld(),
      camera: CameraComponent.withFixedResolution(
          width: gameWidth, height: gameHeight)); //dapat dari constant
 @override
 FutureOr<void> onLoad() async {
   super.onLoad();
   debugMode= true;
 }

  @override
  Color backgroundColor() {
    return Colors.yellow;
  }
//buat deteksi drag di layar handphone device kanan dan kiri
  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    // TODO: implement onHorizontalDragUpdate
    super.onHorizontalDragUpdate(info);
    //our world is where our player exist
    world.player.move(info.delta.global.x);
  }

  @override
  KeyEventResult onKeyEvent(KeyEvent event,
      Set<LogicalKeyboardKey> keyPressed) {
    const double moveSpeed = 55.0;

    if (event is KeyDownEvent) { // Ubah dari RawKeyDownEvent ke KeyDownEvent
      if (keyPressed.contains(LogicalKeyboardKey.arrowRight)) {
        world.player.move(moveSpeed); // every time key is clicked
        return KeyEventResult.handled;
      } else if (keyPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        world.player.move(-moveSpeed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}