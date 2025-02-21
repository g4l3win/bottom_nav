import 'package:flame/game.dart';
import 'package:flame_ular/constants.dart';
import 'package:flame/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'sprites/ular.dart';
import 'sprites/makanan.dart';

class snakeGame extends FlameGame{

  static late Ular snake;
  late makanan food;
  final int gridSize = 20;
  final double cellSize = 20.0;

  //kasih tahu kalau dunia game kit di snakeGameWorld di FlameGame<>
  snakeGame()
      : super(
      camera: CameraComponent.withFixedResolution(
          width: gameWidth, height: gameHeight)); //dapat dari constant


  @override
  Future<void> onLoad() async {
    super.onLoad();

     // debugMode = true; //ini bisa bantu cari titik koordinat dari si elemen game dari

      snake = Ular(gridSize, cellSize);
      food = makanan(gridSize, cellSize);
      add(snake);
      add(food);
      food.spawn(snake.body);

  }

  @override
  Color backgroundColor() {
    return Colors.black;
  }

//fungsi reset game
  void reset() {
    overlays.remove('gameOver'); //menghapus overlay game over
    remove(snake);
    snake = Ular(gridSize,cellSize); //reset ular lagi
    add(snake);
    resumeEngine(); // jalanin game lagi

  }

  void changeSnakeDirection (int kode){
    if(kode ==1){
      snake.changeDirection(LogicalKeyboardKey.arrowUp);
    }else if(kode ==2 ){
      snake.changeDirection(LogicalKeyboardKey.arrowLeft);
    } else if (kode ==3){
      snake.changeDirection(LogicalKeyboardKey.arrowRight);
    } else if(kode==4){
      snake.changeDirection(LogicalKeyboardKey.arrowDown);
    }
  }

}