import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/go_green_game.dart';
import 'package:flame/game.dart';
import 'package:inputkey/game/sprites/player.dart';
import 'dart:async';

class Obstacle extends SpriteComponent with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    required Vector2 position,
  }) : super(position: position);

  final String spritePath;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      other.removeFromParent(); // Hapus player dari game
      gameRef.gameOver();       // Panggil fungsi game over
    }
  }
}

class ObstacleOne extends Obstacle {
  ObstacleOne({required Vector2 position})
      : super(spritePath: 'obstacle.png', position: position);
}

class Obstacletwo extends Obstacle {
  Obstacletwo({required Vector2 position})
      : super(spritePath: 'obstacle2.png', position: position);
}

class ObstacleImage extends Obstacle {
  ObstacleImage({required Vector2 position})
      : super(spritePath: 'image1.jpg', position: position);
}
