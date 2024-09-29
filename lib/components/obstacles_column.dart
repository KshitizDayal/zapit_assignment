import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:zapit_assignment/game/space_game.dart';

import '../constants.dart';
import 'obstacle_placed.dart';

class ObstacleColumn extends PositionComponent with HasGameRef<SpaceGame> {
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

    if (position.x < -430 - Constants.obstacleSize) {
      removeFromParent();
      updateScore();
      // print("removed");
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.player.score += 1;
    FlameAudio.play(Assets.pointAudio);
  }
}
