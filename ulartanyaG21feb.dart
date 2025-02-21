import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Stack(
        children: [
          GameWidget(game: SnakeGame()),
          Positioned(
            bottom: 50,
            left: 50,
            child: Column(
              children: [
                ElevatedButton(onPressed: () => SnakeGame.snake.changeDirection(LogicalKeyboardKey.arrowUp), child: Text('Up')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => SnakeGame.snake.changeDirection(LogicalKeyboardKey.arrowLeft), child: Text('Left')),
                    SizedBox(width: 50),
                    ElevatedButton(onPressed: () => SnakeGame.snake.changeDirection(LogicalKeyboardKey.arrowRight), child: Text('Right')),
                  ],
                ),
                ElevatedButton(onPressed: () => SnakeGame.snake.changeDirection(LogicalKeyboardKey.arrowDown), child: Text('Down')),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}

class SnakeGame extends FlameGame {
  static late Snake snake;
  late Food food;
  final int gridSize = 20;
  final double cellSize = 20.0;

  @override
  Future<void> onLoad() async {
    snake = Snake(gridSize, cellSize);
    food = Food(gridSize, cellSize);
    add(snake);
    add(food);
    food.spawn(snake.body);
  }
}

class Snake extends PositionComponent with HasGameRef<SnakeGame> {
  List<Vector2> body;
  Vector2 direction = Vector2(1, 0);
  final int gridSize;
  final double cellSize;
  double timer = 0;
  final double speed = 0.2;

  Snake(this.gridSize, this.cellSize) : body = [Vector2(5, 5), Vector2(4, 5)];

  void changeDirection(LogicalKeyboardKey key) {
    if (key == LogicalKeyboardKey.arrowUp && direction.y == 0) {
      direction = Vector2(0, -1);
    } else if (key == LogicalKeyboardKey.arrowDown && direction.y == 0) {
      direction = Vector2(0, 1);
    } else if (key == LogicalKeyboardKey.arrowLeft && direction.x == 0) {
      direction = Vector2(-1, 0);
    } else if (key == LogicalKeyboardKey.arrowRight && direction.x == 0) {
      direction = Vector2(1, 0);
    }
  }

  @override
  void update(double dt) {
    timer += dt;
    if (timer >= speed) {
      timer = 0;
      move();
    }
  }

  void move() {
    Vector2 newHead = body.first + direction;

    if (body.contains(newHead)) {
      gameRef.overlays.add('GameOver');
      return;
    }

    newHead.x = (newHead.x + gridSize) % gridSize;
    newHead.y = (newHead.y + gridSize) % gridSize;

    body.insert(0, newHead);
    if (newHead == gameRef.food.position) {
      gameRef.food.spawn(body);
    } else {
      body.removeLast();
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.green;
    for (final segment in body) {
      canvas.drawRect(
        Rect.fromLTWH(segment.x * cellSize, segment.y * cellSize, cellSize, cellSize),
        paint,
      );
    }
  }
}

class Food extends PositionComponent with HasGameRef<SnakeGame> {
  final int gridSize;
  final double cellSize;
  Random random = Random();

  Food(this.gridSize, this.cellSize);

  void spawn(List<Vector2> snakeBody) {
    Vector2 newPosition;
    do {
      newPosition = Vector2(random.nextInt(gridSize).toDouble(), random.nextInt(gridSize).toDouble());
    } while (snakeBody.contains(newPosition));
    position = newPosition;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.red;
    canvas.drawRect(
      Rect.fromLTWH(position.x * cellSize, position.y * cellSize, cellSize, cellSize),
      paint,
    );
  }
}
