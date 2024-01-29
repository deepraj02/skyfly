import 'dart:async';

import 'package:flame/components.dart';
import 'package:skyfly/components/tower.dart';
import 'package:skyfly/game/config.dart';
import 'package:skyfly/game/sky_fly.dart';

import '../game/tower_position.dart';

class TowerGroup extends PositionComponent  with HasGameRef<SkyFly>{
  @override
  FutureOr<void> onLoad() {
    position.x=gameRef.size.x;
    addAll([
      Tower(height: 100, towerPosition: TowerPosition.top),
      Tower(height: 100, towerPosition: TowerPosition.bottom),
    ],);

  }
  @override
  void update(double dt) {
    super.update(dt);
    position.x-=Config.gameSpeed*dt;
  }
}
