import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:skyfly/game/assets.dart';
import 'package:skyfly/game/config.dart';
import 'package:skyfly/game/sky_fly.dart';
import 'package:skyfly/game/tower_position.dart';

class Tower extends SpriteComponent with HasGameRef<SkyFly> {
  @override
  final double height;
  final TowerPosition towerPosition;

  Tower({required this.height, required this.towerPosition});
  @override
  Future<void> onLoad() async {
    final tower = await Flame.images.load(Assets.tower);
    final towerRotated = await Flame.images.load(Assets.tower);
    size = Vector2(200, height);
    switch (towerPosition) {
      case TowerPosition.top:
        position.y = 0;
        sprite = Sprite(towerRotated);
      case TowerPosition.bottom:
        position.y = gameRef.size.y - size.y -Config.groundHeight;
        sprite = Sprite(tower);
        break;
      default:
    }
  }
}
