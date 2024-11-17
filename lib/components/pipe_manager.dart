import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/components/constants.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  /*

  UPDATE -> every second (dt)

  we will continuously spawn new pipes.

  */

  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
    //generate new pipe at given interval
    pipeSpawnTimer += dt;

    if (pipeSpawnTimer > pipeinterval) {
      pipeSpawnTimer = 0;
      spawnPipe();
    }
  }

  /*

  SPAWN NEW PIPE

  */

  void spawnPipe() {
    final double screenHeight = gameRef.size.y;

    /*

    CALCULATE PIPE HEIGHTS

    */

    // max possible height
    final double maxPipeHeight =
        screenHeight - groundHeight - pipeGap - minPipeHeight;

    // height of bottom pipe -> radomly select between min and max
    final double bottomPipeHeight =
        minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    //height of top pipe
    final double topPipeHeight =
        screenHeight - groundHeight - bottomPipeHeight - pipeGap;

    /*

    CREATE BOTTOM PIPE

    */

    final bottomPipe = Pipe(
      //position
      Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),

      //size
      Vector2(pipeWidth, bottomPipeHeight),
      isTopPipe: false,
    );

    /*

    CREATE TOP PIPE

    */

    final topPipe = Pipe(
      //position
      Vector2(gameRef.size.x, 0),

      //size
      Vector2(pipeWidth, topPipeHeight),
      isTopPipe: true,
    );

    // add both pipes to the game

    gameRef.add(bottomPipe);
    gameRef.add(topPipe);
  }
}
