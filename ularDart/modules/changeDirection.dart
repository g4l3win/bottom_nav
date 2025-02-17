import 'ular.dart'; //biar dapat data direction dari kelas ular bukan lokal
class ChangeDirection{
  void changeDirection(int newDirection, ular snake){
    if(newDirection != snake.direction*(-1)){
      snake.direction = newDirection;
    }
  }
}