import 'dart:async';
import 'package:flame/components.dart';

import 'package:flame/game.dart';
import 'package:skyfly/components/background.dart';

import '../components/flight.dart';
import '../components/ground.dart';
import '../components/tower_group.dart';

class SkyFly extends FlameGame {
  SkyFly();
  late Flight flight;
  Timer interval = Timer(1.5, repeat: true);
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      flight = Flight(),
      TowerGroup(),
    ]);
    interval.onTick = () => add(TowerGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
