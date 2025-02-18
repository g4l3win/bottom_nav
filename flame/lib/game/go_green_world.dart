import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:inputkey/game/sprites/bin.dart';
import 'package:inputkey/game/sprites/obstacle.dart';
import 'go_green_game.dart';
import 'package:inputkey/game/sprites/player.dart';
import 'package:inputkey/constants.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;
  @override
  Future<void> onLoad() async {
    super.onLoad();
//so we could add the component to the world not to the game directly
    //so the world would linked up to our game
    player = Player();
    //perhatiin posisi dari addnya di dalam world. yang duluan di add akan ditumpuk di belakang layar
    add(player );
     // ( position: Vector2(-(gameWidth / 4), 0), radius: gameWidth / 4)
    add(Bin());

    // Set posisi obstacle dengan jarak yang cukup
    add(ObstacleOne());
    add(Obstacletwo());
    add(ObstacleImage());

    @override
    void update(double dt){//value pakai dt itu delta time kayak counter yang ngitung 1234 increase y by the value of that time
      super.update(dt);
      children.whereType<Obstacle>().forEach(Obstacle){
        obstacle.position.y
      };
    }
  }
}
