import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybird/components/constants.dart';
import 'package:flappybird/components/ground.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/game.dart';

class Bird extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  /*
    INIT Bird
  */

  //initialize bird position & size
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  //physical world properties
  double velocity = 0;

  /*
    Load
  */

  @override
  Future<void> onLoad() async {
    // load bird sprite image
    sprite = await Sprite.load('bird.png');

    //add hit box
    add(RectangleHitbox());
  }

  /*
    JUMP / FLAp

  */

  void flap() {
    velocity = jumpStrength;
  }

  /*

    UPDATE -> every second

  */

  @override
  void update(double dt) {
    //apply gravity
    velocity += gravity * dt;

    //update bird's position based on current velocity
    position.y += velocity * dt;
  }

  /*

    COLLISION -> with another object

  */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    //check if bird collides with ground
    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }

    // check if bird collides with pipe
    if (other is Pipe) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}
