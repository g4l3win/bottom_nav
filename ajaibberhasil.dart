import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
 runApp(SnakeGame());
}

class SnakeGame extends StatefulWidget {
 @override
 _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
 static const int rows = 20;
 static const int cols = 20;
 static const int speed = 200; // Kecepatan dalam milidetik

 List<int> snake = [42, 41]; // Posisi awal ular
 int direction = 1; // 1 = kanan, -1 = kiri, cols = bawah, -cols = atas
 int food = 55; // Posisi makanan
 bool isPlaying = false;
 Timer? gameLoop;

 void startGame() {
  isPlaying = true;
  snake = [42, 41];
  direction = 1;
  spawnFood();

  gameLoop?.cancel();
  gameLoop = Timer.periodic(Duration(milliseconds: speed), (timer) {
   setState(() {
    moveSnake();
   });
  });
 }

 void moveSnake() {
  int newHead = snake.first + direction;

  // Cek game over (menabrak diri sendiri atau dinding)
  if (snake.contains(newHead) || newHead < 0 || newHead >= rows * cols ||
      (direction == 1 && newHead % cols == 0) ||
      (direction == -1 && newHead % cols == cols - 1)) {
   gameLoop?.cancel();
   isPlaying = false;
   return;
  }

  snake.insert(0, newHead); // Tambahkan kepala baru

  if (newHead == food) {
   spawnFood(); // Jika makan, buat makanan baru
  } else {
   snake.removeLast(); // Hapus ekor jika tidak makan
  }
 }

 void spawnFood() {
  Random random = Random();
  do {
   food = random.nextInt(rows * cols);
  } while (snake.contains(food));
 }

 void changeDirection(int newDirection) {
  if ((direction.abs() != newDirection.abs()) && isPlaying) {
   direction = newDirection;
  }
 }

 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   home: Scaffold(
    backgroundColor: Colors.black,
    body: Column(
     children: [
      Expanded(
       child: GridView.builder(
        itemCount: rows * cols,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: cols,
        ),
        itemBuilder: (context, index) {
         bool isSnake = snake.contains(index);
         bool isFood = index == food;
         return Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
           color: isSnake ? Colors.green : (isFood ? Colors.red : Colors.grey[900]),
           shape: BoxShape.rectangle,
          ),
         );
        },
       ),
      ),
      isPlaying
          ? SizedBox.shrink()
          : ElevatedButton(
       onPressed: startGame,
       child: Text("Mulai Game"),
      ),
      Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        IconButton(icon: Icon(Icons.arrow_upward), onPressed: () => changeDirection(-cols)),
       ],
      ),
      Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        IconButton(icon: Icon(Icons.arrow_back), onPressed: () => changeDirection(-1)),
        SizedBox(width: 50),
        IconButton(icon: Icon(Icons.arrow_forward), onPressed: () => changeDirection(1)),
       ],
      ),
      Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        IconButton(icon: Icon(Icons.arrow_downward), onPressed: () => changeDirection(cols)),
       ],
      ),
     ],
    ),
   ),
  );
 }
}
