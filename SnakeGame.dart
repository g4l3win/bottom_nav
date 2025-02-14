import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
class SnakeGame extends StatefulWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  //variabel
  //keperluan grid tampilan
  int rows = 20; //jumlah baris dalam grid
  int cols = 20; // jumlah kolom dalam grid
  int speed = 200; // dalam milisecond
  //grid itu kotak 20*20 jadi indeksnya 0-399
  //badan ular itu list dari indeks grid. badan ular cuma ada dua kotak grid
  List<int> snake = [42, 41];
  int direction = 1;

  //kode arah
  /// 1 buat kekanan
  /// -1 buat kekiri
  /// cols = buat kebawah
  /// -cols = buat keatas

  //index posisi awal makanan
  int food = 55;

  //status main
  bool isPlaying = false;

  //timer untuk menggerakkan ular
  Timer? gameLoop;

  //fungsi mulai game
  void startGame() {
    isPlaying = true; //bikin kondisi benar lagi main
    snake = [42, 41]; // posisi awal
    direction = 1; //defaultnya buat ke kanan dulu
    spawnFood();

    //memastikan tidak ada timer sebelumnya
    gameLoop?.cancel(); //enggak boleh null;
    //untuk mengatur timer dimulai
    gameLoop = Timer.periodic(Duration(milliseconds: speed), (timer) {
      setState(() {
        moveSnake();
      });
    }
    );
  }

  void moveSnake() {
    var newHead = snake.first + direction;

    //cek nabrak diri sendiri

    //pergerakan
    // if(direction == 1 ){
    //   //ke kanan
    // } else if(direction == -1){
    //   //ke kiri
    // } else if (direction ==20){
    //   //ke bawah
    // }else if(direction ==-20){
    //   // ke atas
    // }
    if (snake.contains(newHead)) {
      //kalau kepala ular sama dengan anggota badannya artinya nabrak game berhenti
      gameLoop?.cancel();
      isPlaying = false;
      return;
    }
    // } else if (newHead<0){
    //   //kalau bagian kepala di posisi grid kurang dari batas atas, karena row atas tuh terdiri dari grid 1-20 kalau kurang dari itu artinya dia udah lewat
    // }else if (newHead > rows * cols){
    //   //kalau kepala lebih dari kotak ke 400, baris terakhir itu ada379-400 lah gitu lebih dari itu artiny dah lewat
    // }
    // else if(direction ==1 && newHead % cols ==0){
    //   //misal sudah sampai di angka grid ke 19 trus player pencet kanan jadi direction +1
    //   //jadi bisa dibilang direction nilai nya 1 karena baru ditekan dan newhead sudah di grid 20 yang bisa habis dibagi kolom
    // }
    // else if( direction ==-1)
    //tambah kepala baru
    snake.insert(0, newHead);

    //kalau kepala ketemu makanan, munculin makanan baru
    //kalau enggak ekornya dihapus
    if (newHead == food) {
      spawnFood();
    } else {
      snake.removeLast();
    }
  }

  void spawnFood() {
    Random random = Random();
    food = random.nextInt(cols * rows);
  }

  void changeDirection(int newDirection){
    direction = newDirection;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
          
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: cols * rows, //jadi total ada 400 kotak
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols, // satu baris ada 20 kotak
                    ), itemBuilder: (context, index) {
                  bool isSnake = snake.contains(
                      index); //kalau kotaknya 41 atau 42 sama kayak yang udah dideclare di variabel list snake awal,
                  // maka isSnake akan bernilai true;
                  //harus pakai isCOntain karena yang mau dicocokin si snake itu list
                  bool isFood = food == index; // ini sama tapi buat makanan
                  return Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: //jika is snake trus maka warna hijau
                      //else if isfood true maka warna merah
                      //else warna abu
                      isSnake ? Colors.green : isFood ? Colors.red : Colors.grey,
          
                    ),
                  );
                }
          
                ),
              ),
              ElevatedButton(onPressed: (){
                startGame();
              }, child: Text("Mulai")),
              ElevatedButton(onPressed: (){
                changeDirection(-20);
              }, child: Text("atas")),
              ElevatedButton(onPressed: (){
                changeDirection(1);
              }, child: Text("kanan")),
              ElevatedButton(onPressed: (){
                changeDirection(-1);
              }, child: Text("kiri")),
              ElevatedButton(onPressed: (){
                changeDirection(20);
              }, child: Text("bawah")),
            ],
          
          ),
        )
    );
  }

}
