import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:inputkey/game/sprites/bin.dart';
import 'package:inputkey/game/sprites/obstacle.dart';
import 'go_green_game.dart';
import 'package:inputkey/game/sprites/player.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/level_data.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;
  // //buat ngeload level
  void loadLevel(List<ObstacleData> levelData) {
    //remove obstacle yang ada sebelumnya
    //removeAll(children.whereType<Obstacle>().toList());

    //load new obstacle dari level data
    for (var data in levelData) {
      Obstacle obstacle;
      if (data.type == ObstacleType.one) {
        obstacle = ObstacleOne(position: data.position);
      } else if (data.type == ObstacleType.two) {
        obstacle = Obstacletwo(position: data.position);
      } else if (data.type == ObstacleType.image) {
        obstacle = ObstacleImage(position: data.position);
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
//so we could add the component to the world not to the game directly
    //so the world would linked up to our game
    player = Player();

    //perhatiin posisi dari addnya di dalam world. yang duluan di add akan ditumpuk di belakang layar
    add(player);
    // ( position: Vector2(-(gameWidth / 4), 0), radius: gameWidth / 4)
    add(Bin());

    // Set posisi obstacle dengan jarak yang cukup
    // add(ObstacleOne( position: Vector2(200, 200)));
    // add(Obstacletwo(position: Vector2(-300, -400)));
    // add(ObstacleImage(position: Vector2(400,  -800)));
    loadLevel(LevelData().generateRandomlevel(10));
  }

  //Fungsi update jangan ditaro di dalam onLoad!!!
  @override
  void update(double dt) {
    //value pakai dt itu delta time kayak counter yang ngitung 1234 increase y by the value of that time
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.position.y -= 400 * dt; // Mengurangi y agar bergerak ke atas

      //biar reset posisi obstacle
      if (obstacle.position.y < -gameRef.size.y / 2) {
        obstacle.position.y = gameRef.size.y;
      }
    });
  }
}
