import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:zapit_assignment/constants.dart';

import '../space_game.dart';
import 'obstacle.dart';

class ObstacleColumn extends PositionComponent with HasGameRef<SpaceGame> {
  final double stoneSize = 50; // Fixed size for each stone
  final int totalStones = 6; // Number of stones in a column
  final int emptySpots = 2; // Number of empty spots
  final _random = Random();

  ObstacleColumn();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y;
    final spacing =
        (heightMinusGround - (stoneSize * totalStones)) / (totalStones + 1);

    // Generate two random empty positions
    final List<int> emptyPositions = [];
    while (emptyPositions.length < emptySpots) {
      int randomPosition = _random.nextInt(totalStones);
      if (!emptyPositions.contains(randomPosition)) {
        emptyPositions.add(randomPosition);
      }
    }

    // Add stones at positions where there are no gaps
    for (int i = 0; i < totalStones; i++) {
      if (!emptyPositions.contains(i)) {
        final double yPosition = (i + 1) * spacing + i * stoneSize;
        add(ObstacleStone(y: yPosition, stoneSize: stoneSize));
      }
    }
  }
}

class ObstacleStone extends Obstacle {
  final double y;
  final double stoneSize;

  ObstacleStone({required this.y, required this.stoneSize})
      : super(
          spritePath: 'stone.png',
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    position.y = y;
    position.x = gameRef.size.x; // Start at the right edge
    // add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= gameSpeed * dt;

    if (position.x < -size.x) {
      removeFromParent(); // Remove stone once off-screen
    }
  }
}
