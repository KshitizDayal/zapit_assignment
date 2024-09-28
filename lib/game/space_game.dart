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
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      player = Player(),
      ObstacleColumn(),
    ]);
    interval.onTick = () => add(ObstacleColumn());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    debugMode = true;
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
