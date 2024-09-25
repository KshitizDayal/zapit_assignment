import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../constants.dart';
import '../space_game.dart';

class Player extends SpriteComponent
    with HasGameRef<SpaceGame>, CollisionCallbacks {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load("spaceship.png");
    size = Vector2.all(150);
    position = Vector2(-(gameWidth / 4), 0);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  void move(double delatY) {
    double newY = position.y + delatY;

    double minY = -(gameRef.size.y / 2) + size.y / 2;
    double maxY = (gameRef.size.y / 2) - size.y / 2;
    newY = newY.clamp(minY, maxY);

    position.y = newY;
  }
}
