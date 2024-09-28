import 'dart:async';

import 'package:flame/components.dart';
import 'package:zapit_assignment/game/space_game.dart';

import '../components/background.dart';
import '../components/obstacles_column.dart';
import '../components/player.dart';
import '../constants.dart';

class SpaceGameWorld extends World with HasGameRef<SpaceGame> {
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
}
