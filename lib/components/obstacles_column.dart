import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:zapit_assignment/game/space_game.dart';

import '../constants.dart';
import 'obstacle_placed.dart';

class ObstacleColumn extends PositionComponent
    with HasGameRef<SpaceGame>, CollisionCallbacks {
  ObstacleColumn();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    addAll([
      ObstaclePlaced(),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Constants.gameSpeed * dt;

    if (gameRef.isHit == true) {
      removeFromParent();
      gameRef.isHit = false;
    }

    if (position.x < -550) {
      removeFromParent();
    }

    if (gameRef.resetObstacles) {
      removeFromParent();
      gameRef.resetObstacles = false;
    }
  }

  void updateScore() {
    gameRef.isHit = true;
    gameRef.player.score += 1;

    FlameAudio.play(Assets.pointAudio);
  }
}
