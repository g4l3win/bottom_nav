import 'package:flutter/material.dart';
import 'dart:async';

import 'modules/board.dart';
import 'modules/makanan.dart';
import 'modules/ular.dart';
import 'modules/changeDirection.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  Board board = Board();
  Food makanan = Food();
  ular Snake = ular();
  ChangeDirection gantiArah = ChangeDirection();
  //kode arah
  /// 1 buat kekanan
  /// -1 buat kekiri
  /// cols 20 poin = buat kebawah
  /// -cols -20 poin= buat keatas
  //status main
  bool isPlaying = false;


  @override
  void startGame() {
    resetGame();
    setState(() {
      isPlaying = true;
    });

    makanan.spawnFood(board.cols, board.rows);
    // Memastikan tidak ada timer sebelumnya
    board.gameLoop?.cancel();

    // Mengatur timer agar ular bergerak
    board.gameLoop = Timer.periodic(Duration(milliseconds: board.speed), (timer) {
      if (!isPlaying) {
        timer.cancel();
        return;
      }
      setState(() {
        Snake.moveSnake(() {
          stopGame(); // Callback untuk mengubah isPlaying menjadi false
        }, board.cols, board.rows, makanan);
      });
    });
  }

  void stopGame(){
    setState(() {
      isPlaying = false;
    });
    board.gameLoop?.cancel();
  }
 void resetGame(){
    setState(() {
      isPlaying = false;
      Snake = ular();
      makanan.spawnFood(board.cols, board.rows);
    });
    board.gameLoop?.cancel();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: board.cols * board.rows,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: board.cols,
                ),
                itemBuilder: (context, index) {
                  bool isSnake = Snake.snake.contains(index);
                  bool isFood = makanan.food == index;

                  return Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: isSnake ? Colors.green
                          : isFood ? Colors.red
                          : Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: startGame,
              child: Text("Mulai"),
            ),

            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                gantiArah.changeDirection(-20, Snake);
              },
              child: Text("Atas"),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    gantiArah.changeDirection(-1, Snake);
                  },
                  child: Text("Kiri"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    gantiArah.changeDirection(1, Snake);
                  },
                  child: Text("Kanan"),
                ),
              ],
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                gantiArah.changeDirection(20, Snake);
              },
              child: Text("Bawah"),
            ),
          ],
        ),
      ),
    );
  }
}
