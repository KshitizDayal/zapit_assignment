import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zapit_assignment/components/obstacles_column.dart';
import 'package:zapit_assignment/components/player.dart';

import '../components/background.dart';
import '../constants.dart';

class SpaceGame extends FlameGame
    with VerticalDragDetector, KeyboardEvents, HasCollisionDetection {
  late Player player;
  Timer interval = Timer(Constants.columnInterval, repeat: true);
  late TextComponent score;
  bool isHit = false;

  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      player = Player(),
      ObstacleColumn(),
      score = builScore(),
    ]);
    interval.onTick = () => add(ObstacleColumn());
    return super.onLoad();
  }

  TextComponent builScore() {
    return TextComponent(
      text: "Score: 0",
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: "Game",
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    // debugMode = true;

    score.text = "Score: ${player.score}";
  }

  @override
  void onVerticalDragUpdate(DragUpdateInfo info) {
    player.move(info.delta.global.y);
    super.onVerticalDragUpdate(info);
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    const double movespeed = 55.0;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
        player.move(-movespeed);
        return KeyEventResult.handled;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
        player.move(movespeed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}
