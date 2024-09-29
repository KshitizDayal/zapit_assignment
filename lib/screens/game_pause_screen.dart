import 'package:flutter/material.dart';
import 'package:zapit_assignment/game/space_game.dart';
import 'package:zapit_assignment/game/game_highscore.dart';

class GamePauseScreen extends StatelessWidget {
  final SpaceGame game;
  static const String id = "gamePause";
  const GamePauseScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Game Paused",
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Game",
                  color: Color(0xFF97FEED)),
            ),
            const SizedBox(height: 20),
            Text(
              "Current Score: ${game.player.score}",
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Game",
                  color: Colors.white),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: resumeGame,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE7CCCC)),
              child: const Text(
                "Resume",
                style: TextStyle(fontSize: 20, color: Color(0xFF433878)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: restartGame,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE4B1F0)),
              child: const Text(
                "Restart",
                style: TextStyle(fontSize: 20, color: Color(0xFF433878)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: homeScreen,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE1FF)),
              child: const Text(
                "Home Screen",
                style: TextStyle(fontSize: 20, color: Color(0xFF433878)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void restartGame() async {
    if (int.parse(SecureStorage.instance.highestScore) < game.player.score) {
      SecureStorage.instance.storeHighScore(game.player.score.toString());
    }
    game.player.resetPosition();
    game.overlays.remove('gamePause');
    game.resumeEngine();
  }

  void homeScreen() {
    if (int.parse(SecureStorage.instance.highestScore) < game.player.score) {
      SecureStorage.instance.storeHighScore(game.player.score.toString());
    }
    game.overlays.remove('gamePause');
    game.player.resetPosition();
    game.overlays.add('gameStart');
  }

  void resumeGame() {
    game.overlays.remove('gamePause');
    game.resumeEngine();
  }
}
