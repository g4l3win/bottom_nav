import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_ular/game/sprite/ular.dart';

class SnakeController extends Component with HasGameRef, Tappable {
  final Ular ular;

  snakeController(this.player);

  @override
  bool onPanUpdate(DragUpdateInfo info) {
    final delta = info.delta.global;
    if(ular.x.abs() > delta.y.abs()){
      ular.direction = delta.x >0 ? Vector2(1,0) : Vector(-1,0);
    }else{
      ular.direction = delta.y > 0 ? Vector2(0,1) : Vector(0,-1);
    }
    return true;
}
