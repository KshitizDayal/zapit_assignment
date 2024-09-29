import 'package:flutter/material.dart';
import 'package:zapit_assignment/game/space_game.dart';

class GameOverScreen extends StatelessWidget {
  final SpaceGame game;
  static const String id = "gameOver";
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Score: ${game.player.score}",
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Game",
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Game Over",
              style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Game",
                  color: Color(0xFF97FEED)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: restartGame,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFFE4B1F0)),
              child: const Text(
                "Restart",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: homeScreen,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFE1FF)),
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

  void restartGame() {
    game.player.resetPosition();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }

  void homeScreen() {}
}
