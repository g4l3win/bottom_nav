import 'dart:math';
class Food{
  //index posisi awal makanan
  int food = 55;
  void spawnFood(int cols, int rows) {
    Random random = Random();
    food = random.nextInt(cols * rows);
  }
}