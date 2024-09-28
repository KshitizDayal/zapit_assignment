import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:zapit_assignment/constants.dart';

import '../game/space_game.dart';

class Player extends SpriteComponent
    with HasGameRef<SpaceGame>, CollisionCallbacks {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load("spaceship.png");
    size = Vector2.all(Constants.playerheight);
    position = Vector2(75, gameRef.size.y / 2 - size.y / 2);
    anchor = Anchor.center;
    add(RectangleHitbox());
    angle = 1.5708;
  }

  void move(double delatY) {
    double newY = position.y + delatY;

    double minY = -(gameRef.size.y) + size.y / 2;
    double maxY = (gameRef.size.y) - size.y / 2;
    newY = newY.clamp(minY, maxY);

    position.y = newY;
  }
}
