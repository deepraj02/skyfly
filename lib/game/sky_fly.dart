import 'dart:async';

import 'package:flame/game.dart';
import 'package:skyfly/components/background.dart';

import '../components/flight.dart';
import '../components/ground.dart';
import '../components/tower_group.dart';

class SkyFly extends FlameGame {
  late Flight flight;
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      flight = Flight(),
      TowerGroup(),
    ]);
  }
}
