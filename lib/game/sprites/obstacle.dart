import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../constants.dart';
import '../space_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<SpaceGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    required this.currentSizex,
    required this.currentSizey,
  });

  final String spritePath;
  final double currentSizex;
  final double currentSizey;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(spritePath);
    // size = Vector2(currentSizex, currentSizey);
    size = Vector2.all(obstacleSize);

    anchor = Anchor.center;
    // add(CircleHitbox());
  }
}

class ObstacleRock extends Obstacle {
  ObstacleRock()
      : super(
          spritePath: 'rock.png',
          // currentSizex: obstacleSizex * 0.9,
          // currentSizey: obstacleSizey * 0.45,
          currentSizex: obstacleSize,
          currentSizey: obstacleSize,

          // currentSizex: obstacleSizex,
          // currentSizey: obstacleSizey,
        );
}

class ObstacleMountain extends Obstacle {
  ObstacleMountain()
      : super(
          spritePath: 'mountain.png',
          // currentSizex: obstacleSizex * 1.6,
          // currentSizey: obstacleSizey,
          currentSizex: obstacleSize,
          currentSizey: obstacleSize,
          // currentSizex: obstacleSizex,
          // currentSizey: obstacleSizey,
        );
}

class ObstacleStone extends Obstacle {
  ObstacleStone()
      : super(
          spritePath: 'stone.png',
          // currentSizex: obstacleSizex * 0.4,
          // currentSizey: obstacleSizey * 0.4,
          currentSizex: obstacleSize,
          currentSizey: obstacleSize,
          // currentSizex: obstacleSizex,
          // currentSizey: obstacleSizey,
        );
}
