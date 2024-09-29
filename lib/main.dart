import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:zapit_assignment/game/space_game.dart';

import 'screens/game_pause_screen.dart';
import 'screens/game_start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final game = SpaceGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [GameStartScreen.id],
      overlayBuilderMap: {
        'gameStart': (context, _) => GameStartScreen(game: game),
        'gamePause': (context, _) => GamePauseScreen(game: game),
      },
    ),
  );
}
