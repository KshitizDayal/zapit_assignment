import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

import '../game/space_game.dart';

class ObstaclePlaced extends Component with HasGameRef<SpaceGame> {
  final double stoneSize = 100.0; // Fixed size for each stone
  final int totalStones = 6; // Number of stones in a column
  final int emptySpots = 2; // Number of empty spots
  final _random = Random();

  ObstaclePlaced();

  @override
  FutureOr<void> onLoad() {
    // Calculate the available height for placing obstacles
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
        final ObstacleStone obstacleStone =
            ObstacleStone(y: yPosition, stoneSize: stoneSize);
        add(obstacleStone);
      }
    }
    return super.onLoad();
  }
}

class ObstacleStone extends SpriteComponent with HasGameRef<SpaceGame> {
  final double y;
  final double stoneSize;

  ObstacleStone({required this.y, required this.stoneSize})
      : super(size: Vector2.all(stoneSize));

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('stone.png'); // Load the sprite here
    super.onLoad();

    position = Vector2(gameRef.size.x, y);
    // add(RectangleHitbox());
  }
}
