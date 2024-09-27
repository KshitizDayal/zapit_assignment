import 'dart:math';

import 'package:flame/components.dart';

import '../constants.dart';

enum ObstacleType {
  rock,
  mountain,
  stone,
}

class ObstacleData {
  final Vector2 position;
  final ObstacleType type;

  ObstacleData({required this.position, required this.type});
}

final random = Random();

class LevelData {
  final obstacleSpacing =
      obstacleSize + (playerheight * 2); // Adjust for vertical spacing
  final topSide = -(gameHeight / 2) + (obstacleSize / 2); // Adjust for top
  final bottomSide = (gameHeight / 2) - (obstacleSize / 2); // Adjust for bottom

  List<ObstacleData> level() {
    List<ObstacleData> level = [];

    // Generating obstacles for each column
    for (int column = 0; column <= 4; column++) {
      final generatedItems = randomColumnObstacles();
      level.addAll(obstacleColumn(
        column: column,
        item1: generatedItems[0],
        item2: generatedItems[1],
        item3: generatedItems[2],
        item4: generatedItems[3],
        item5: generatedItems[4],
      ));
    }

    return level;
  }

  List<ObstacleType?> randomColumnObstacles() {
    final availableObjects = [
      ObstacleType.rock,
      ObstacleType.mountain,
      ObstacleType.stone,
      null,
    ];

    // Ensure some null values to create gaps
    List<ObstacleType?> result = [
      null,
    ];

    for (int item = 1; item <= 4; item++) {
      int randomIndex = random.nextInt(availableObjects.length);
      result.add(availableObjects[randomIndex]);
    }

    result.shuffle(random);
    return result;
  }

  List<ObstacleData> obstacleColumn({
    required int column,
    ObstacleType? item1,
    ObstacleType? item2,
    ObstacleType? item3,
    ObstacleType? item4,
    ObstacleType? item5,
  }) {
    List<ObstacleData> content = [];
    final xPosition =
        obstacleSpacing * column; // X position stays the same for the column

    if (column < 0 || column > 5) {
      throw Exception("Column is out of range");
    }

    if (item1 != null) {
      content.add(
        ObstacleData(
          position: Vector2(xPosition, topSide),
          type: item1,
        ),
      );
    }
    if (item2 != null) {
      content.add(
        ObstacleData(
          position: Vector2(xPosition, topSide + (gameHeight / 5)),
          type: item2,
        ),
      );
    }
    if (item3 != null) {
      content.add(
        ObstacleData(
          position: Vector2(xPosition, 0),
          type: item3,
        ),
      );
    }
    if (item4 != null) {
      content.add(
        ObstacleData(
          position: Vector2(xPosition, bottomSide - (gameHeight / 5)),
          type: item4,
        ),
      );
    }
    if (item5 != null) {
      content.add(
        ObstacleData(
          position: Vector2(xPosition, bottomSide),
          type: item5,
        ),
      );
    }

    return content;
  }
}
