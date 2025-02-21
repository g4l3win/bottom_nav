// import 'package:flame/camera.dart';
// import 'package:flame/components.dart';
// import 'sprites/ular.dart';
// import 'sprites/makanan.dart';
// import 'snakeGame.dart';
// import 'package:flutter/services.dart';
// class snakeGameWorld extends World with HasGameRef<snakeGame> {
//   static late Ular snake;
//   late makanan food;
//   final int gridSize = 20;
//   final double cellSize = 20.0;
//
//   @override
//   Future<void> onLoad() async {
//     if (!gameRef.isMounted) return; // Cegah eksekusi jika game sudah dihapus
//     snake = Ular(gridSize, cellSize);
//     food = makanan(gridSize, cellSize);
//     add(snake);
//     add(food);
//     food.spawn(snake.body);
//   }
//   void changeSnakeDirection (int kode){
//     if(kode ==1){
//       snake.changeDirection(LogicalKeyboardKey.arrowUp);
//     }else if(kode ==2 ){
//       snake.changeDirection(LogicalKeyboardKey.arrowLeft);
//     } else if (kode ==3){
//       snake.changeDirection(LogicalKeyboardKey.arrowRight);
//     } else if(kode==4){
//       snake.changeDirection(LogicalKeyboardKey.arrowDown);
//     }
//   }
//
// }
// // late Ular ular;
// // late GridMap gridMap;
// // late makanan food;
// //
// // @override
// // Future<void> onLoad() async {
// //   if (!gameRef.isMounted) return; // Cegah eksekusi jika game sudah dihapus
// //
// //   gridMap = GridMap(20, 20, gameRef.size.x / 20);
// //   ular = Ular(gridMap);
// //   food = makanan(gridMap);
// //   add(ular);
// //
// //   //spawn makanan pertama kali
// //   food.spawnFood();
// //   add(food);
// // }
// //
// // //logika untuk mengubah pergerakan ular dia memanggil fungsi
// // //change direction yang ada di kelas ular
// // void changeSnakeDirection (int dx, int dy){
// //   ular.changeDirection(dx, dy);
// // }
//
// // @override
// // void update(double dt){
// //   if (!gameRef.isMounted) return;
// //   super.update(dt);
// //
// //   //cek tubrukkan ular dan kepala ular disini
// //   //si food.position itu extend dari component nya flame
// //   //if(ular.body.first == food.position){ // enggak bisa kayak gii karena
// //     //food.position itu posisinya dalam bentuk piksel
// //     //sedangkan di badan ular udah ada conversinya
// //     if(ular.body.first == food.position){
// //     //ular g remove ekor
// //     //ular.grow();
// //     //makanan respawn lagi
// //     food.spawnFood();
// //   }
// //   else{
// //   ular.shrink();
// // }
//
