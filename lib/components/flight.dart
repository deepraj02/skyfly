import 'dart:async';

import 'package:flame/components.dart';
import 'package:skyfly/game/assets.dart';
import 'package:skyfly/game/flight_movement.dart';

import '../game/sky_fly.dart';

class Flight extends SpriteGroupComponent<FlightMovement>
    with HasGameRef<SkyFly> {
  Flight();
  @override
  FutureOr<void> onLoad() async {
    final flightNormal = await gameRef.loadSprite(Assets.flight);
    final flightUp = await gameRef.loadSprite(Assets.flightUp);
    final flightDown = await gameRef.loadSprite(Assets.flightDown);

    size = Vector2(250, 200);
    position = Vector2(gameRef.size.x / 8, 120);
    current = FlightMovement.normal;
    sprites = {
      FlightMovement.normal: flightNormal,
      FlightMovement.up: flightUp,
      FlightMovement.down: flightDown,
    };
  }
}
