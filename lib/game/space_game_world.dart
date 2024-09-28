// import 'dart:async';

// import 'package:flame/components.dart';
// import 'package:zapit_assignment/constants.dart';
// import 'package:zapit_assignment/game/level_data.dart';
// import 'package:zapit_assignment/game/sprites/obstacle.dart';
// import 'package:zapit_assignment/game/sprites/obstacle_column.dart';

// import 'sprites/player.dart';
// import 'space_game.dart';

// class SpaceGameWorld extends World with HasGameRef<SpaceGame> {
//   late final Player player;

//   Timer interval = Timer(pipeInterval, repeat: true);

//   // void loadLevel(List<ObstacleData> levelData) {
//   //   removeAll(children.whereType<Obstacle>().toList());

//   //   for (var data in levelData) {
//   //     Obstacle obstacle;
//   //     if (data.type == ObstacleType.mountain) {
//   //       obstacle = ObstacleMountain()..position = data.position;
//   //     } else if (data.type == ObstacleType.rock) {
//   //       obstacle = ObstacleRock()..position = data.position;
//   //     } else if (data.type == ObstacleType.stone) {
//   //       obstacle = ObstacleStone()..position = data.position;
//   //     } else {
//   //       continue;
//   //     }
//   //     add(obstacle);
//   //   }
//   // }

//   @override
//   FutureOr<void> onLoad() {
//     super.onLoad();
//     player = Player();
//     // earth = Earth();

//     add(player);
//     // add(earth);

//     // add(ObstacleMountain()..position = Vector2(0, 0));
//     // add(ObstacleRock()..position = Vector2(0, -obstacleSize * 4));
//     // add(ObstacleStone()..position = Vector2(0, obstacleSize * 4));
//     // loadLevel(LevelData().level());
//     interval.onTick = () => add(ObstacleColumn());
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     interval.update(dt);
//     // score.text = 'Score: ${bird.score}';
//   }

//   // @override
//   // void update(double dt) {
//   //   super.update(dt);

//   //   children.whereType<Obstacle>().forEach((obstacle) {
//   //     obstacle.position.x -= (dt * 200);

//   //     if (obstacle.position.x < -(gameRef.size.x)) {
//   //       obstacle.position.x = extendedWidth;
//   //     }
//   //   });
//   // }

//   // @override
//   // void update(double dt) {
//   //   super.update(dt);

//   //   children.whereType<Obstacle>().forEach((obstacle) {
//   //     obstacle.position.y -= (dt * 200);

//   //     if (obstacle.position.y < -(gameRef.size.y / 2)) {
//   //       obstacle.position.y = extendedheight;
//   //     }
//   //   });
//   // }
// }

