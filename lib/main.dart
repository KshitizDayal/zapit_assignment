import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:zapit_assignment/game/space_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final game = SpaceGame();
  runApp(GameWidget(game: game));
}
