// import 'dart:async';

// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:zapit_assignment/game/space_game_world.dart';

// import '../constants.dart';

// class SpaceGame extends FlameGame<SpaceGameWorld>
//     with VerticalDragDetector, KeyboardEvents, HasCollisionDetection {
//   SpaceGame()
//       : super(
//           world: SpaceGameWorld(),
//           camera: CameraComponent.withFixedResolution(
//             width: gameWidth,
//             height: gameHeight,
//           ),
//         );

//   @override
//   FutureOr<void> onLoad() {
//     super.onLoad();
//     // make it false to remove the squares
//     debugMode = true;
//   }

//   @override
//   Color backgroundColor() {
//     return spaceColor;
//   }

//   // @override
//   // void onHorizontalDragUpdate(DragUpdateInfo info) {
//   //   super.onHorizontalDragUpdate(info);
//   //   world.player.move(info.delta.global.x);
//   // }

//   @override
//   void onVerticalDragUpdate(DragUpdateInfo info) {
//     world.player.move(info.delta.global.y);
//     super.onVerticalDragUpdate(info);
//   }

//   @override
//   KeyEventResult onKeyEvent(
//       KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
//     const double movespeed = 55.0;

//     if (event is KeyDownEvent) {
//       if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
//         world.player.move(-movespeed);
//         return KeyEventResult.handled;
//       } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
//         world.player.move(movespeed);
//         return KeyEventResult.handled;
//       }
//     }
//     return KeyEventResult.ignored;
//   }
// }

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

import '../constants.dart';
import 'sprites/obstacle_column.dart';
import 'sprites/player.dart';

class SpaceGame extends FlameGame with TapDetector, HasCollisionDetection {
  SpaceGame();

  late final Player player;
  Timer interval = Timer(pipeInterval, repeat: true); // Keep the same interval
  bool isHit = false;
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    addAll([
      player = Player(),
      score = buildScore(),
    ]);

    // Add stone columns instead of pipes
    interval.onTick = () => add(ObstacleColumn());
  }

  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontFamily: 'Game',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
