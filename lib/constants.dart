import 'package:flutter/material.dart';

const Color spaceColor = Color(0xFF210535);

const double gameWidth = 1080.0;
const double gameHeight = 1920.0;

const double obstacleSizex = 180.0;
const double obstacleSizey = 192.0;

const obstacleSize = 216.0;

const double extendedheight = gameHeight * 4;
const double extendedWidth = gameWidth * 5;
const double pipeInterval = 1.5;

const double playerheight = 150;

const gameSpeed = 200.0;




// class LevelData {
//   final obstacleSpacing = obstacleSize + (playerheight * 2);
//   final leftSide = -(gameWidth / 2) + (obstacleSize / 2);
//   final rightSide = (gameWidth / 2) - (obstacleSize / 2);
//   final random = Random();

//   List<ObstacleData> level() {
//     List<ObstacleData> level = [];

//     // randomly generate the rows
//     for (int row = 0; row < 14; row++) {
//       final generatedItems = randomRowObstacles();
//       level.addAll(obstacleRow(
//         row: row,
//         item1: generatedItems[0],
//         item2: generatedItems[1],
//         item3: generatedItems[2],
//         item4: generatedItems[3],
//         item5: generatedItems[4],
//       ));
//     }

//     return level;
//   }

//   List<ObstacleType?> randomRowObstacles() {
//     final availableObjects = [
//       ObstacleType.rock,
//       ObstacleType.mountain,
//       ObstacleType.stone,
//       null,
//     ];

//     // ensure at least one item is null
//     List<ObstacleType?> result = [null];

//     // fill list with 4 more random items
//     for (int item = 0; item < 4; item++) {
//       int randomIndex = random.nextInt(availableObjects.length);
//       result.add(availableObjects[randomIndex]);
//     }

//     result.shuffle(random);
//     return result;
//   }

//   List<ObstacleData> obstacleRow({
//     required int row,
//     ObstacleType? item1,
//     ObstacleType? item2,
//     ObstacleType? item3,
//     ObstacleType? item4,
//     ObstacleType? item5,
//   }) {
//     List<ObstacleData> content = [];
//     final yPosition = obstacleSpacing * row;

//     if (row < 0 || row > 14) {
//       throw Exception("Row is out of range must be between 0..14");
//     }

//     if (item1 != null) {
//       content.add(
//         ObstacleData(
//           position: Vector2(leftSide, yPosition),
//           type: item1,
//         ),
//       );
//     }
//     if (item2 != null) {
//       content.add(
//         ObstacleData(
//           position: Vector2(leftSide + (gameWidth / 5), yPosition),
//           type: item2,
//         ),
//       );
//     }
//     if (item3 != null) {
//       content.add(
//         ObstacleData(
//           position: Vector2(0, yPosition),
//           type: item3,
//         ),
//       );
//     }
//     if (item4 != null) {
//       content.add(
//         ObstacleData(
//           position: Vector2(rightSide - (gameWidth / 5), yPosition),
//           type: item4,
//         ),
//       );
//     }
//     if (item5 != null) {
//       content.add(
//         ObstacleData(
//           position: Vector2(rightSide, yPosition),
//           type: item5,
//         ),
//       );
//     }

//     return content;
//   }
// }