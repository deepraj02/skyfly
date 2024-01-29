import 'dart:async';

import 'package:flame/game.dart';
import 'package:skyfly/components/background.dart';

import '../components/flight.dart';

class SkyFly extends FlameGame {
  late Flight flight;
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      flight = Flight(),
    ]);
  }
}
