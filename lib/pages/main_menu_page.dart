import 'package:flappybird/game.dart';
import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  const MainMenuPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Image.asset(
            'assets/images/game_start.png',
          ),
        ),
      ),
    );
  }
}
