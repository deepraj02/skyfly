import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:skyfly/components/tower.dart';
import 'package:skyfly/game/config.dart';
import 'package:skyfly/game/sky_fly.dart';

import '../game/tower_position.dart';

class TowerGroup extends PositionComponent with HasGameRef<SkyFly> {
  final _random = Random();
  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing / 2);

    addAll(
      [
        Tower(height: centerY - spacing, towerPosition: TowerPosition.top),
        Tower(
          height: heightMinusGround - centerY - spacing / 2,
          towerPosition: TowerPosition.bottom,
        ),
      ],
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -5) {
      removeFromParent();
      debugPrint("Removed");
    }
  }
}
