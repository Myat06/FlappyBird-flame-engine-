import 'package:flappybird/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOverPage extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';
  const GameOverPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/game_over.png",
              width: 500,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  onRestart();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.gameOver();
    game.overlays.remove('gameOver');
    game.resumeEngine();
    game.resetGame();
  }
}
