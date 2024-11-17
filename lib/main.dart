import 'package:flame/game.dart';
import 'package:flappybird/game.dart';
import 'package:flappybird/pages/game_over_page.dart';
import 'package:flappybird/pages/main_menu_page.dart';
import 'package:flutter/widgets.dart';

void main() {
  final game = FlappyBirdGame();

  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuPage.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuPage(game: game),
      'gameOver': (context, _) => GameOverPage(game: game),
    },
  ));
}
