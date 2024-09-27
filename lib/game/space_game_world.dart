import 'dart:async';

import 'package:flame/components.dart';
import 'package:zapit_assignment/constants.dart';
import 'package:zapit_assignment/game/level_data.dart';
import 'package:zapit_assignment/game/sprites/obstacle.dart';

import 'sprites/player.dart';
import 'space_game.dart';

class SpaceGameWorld extends World with HasGameRef<SpaceGame> {
  late final Player player;

  void loadLevel(List<ObstacleData> levelData) {
    removeAll(children.whereType<Obstacle>().toList());

    for (var data in levelData) {
      Obstacle obstacle;
      if (data.type == ObstacleType.mountain) {
        obstacle = ObstacleMountain()..position = data.position;
      } else if (data.type == ObstacleType.rock) {
        obstacle = ObstacleRock()..position = data.position;
      } else if (data.type == ObstacleType.stone) {
        obstacle = ObstacleStone()..position = data.position;
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Player();
    // earth = Earth();

    add(player);
    // add(earth);

    // add(ObstacleMountain()..position = Vector2(0, 0));
    // add(ObstacleRock()..position = Vector2(0, -obstacleSize * 4));
    // add(ObstacleStone()..position = Vector2(0, obstacleSize * 4));
    loadLevel(LevelData().level());
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.position.x -= (dt * 300);

      if (obstacle.position.x < -(gameRef.size.x)) {
        obstacle.position.x = gameWidth;
      }
    });
  }
}
