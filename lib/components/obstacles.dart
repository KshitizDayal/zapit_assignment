import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../constants.dart';
import '../game/space_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<SpaceGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
  });

  final String spritePath;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(Constants.obstacleSize);

    anchor = Anchor.center;
    // add(CircleHitbox());
  }
}

class ObstacleRock extends Obstacle {
  ObstacleRock()
      : super(
          spritePath: 'rock.png',
        );
}

class ObstacleMountain extends Obstacle {
  ObstacleMountain()
      : super(
          spritePath: 'mountain.png',
        );
}

class ObstacleStone extends Obstacle {
  ObstacleStone()
      : super(
          spritePath: 'stone.png',
        );
}
