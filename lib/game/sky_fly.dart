import 'dart:async';

import 'package:flame/game.dart';
import 'package:skyfly/components/background.dart';

class SkyFly extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    add(Background());
  }
}
