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
  int speed = 600; // dalam milisecond
  //grid itu kotak 20*20 jadi indeksnya 0-399
  //badan ular itu list dari indeks grid. badan ular cuma ada dua kotak grid
  List<int> snake = [42, 41];
  int direction = 1;

  //kode arah
  /// 1 buat kekanan
  /// -1 buat kekiri
  /// cols 20 poin = buat kebawah
  /// -cols -20 poin= buat keatas

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
    });
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
    //kalau kepala muncul di sisi kanan, maka dia akan muncul di sisi kiri
    //misal posisi newHead 19 + direction 1 = 20
    //biar muncul lagi di grid 0 (grid paling kiri atas) harus dikurangin 20
    else if (direction == 1 && newHead % cols == 0) {
      newHead = newHead - cols;
      //cols ada 20
    }
    //lagi gerak ke kiri direction = -1, jadi newHeadnya mepet kiri 0 - 1= -1
    //newhead -1 %20 = 19 siapa sangka wowowowwo
    // newHead 19 % 20 = 19 wwowowowo
    //jadi newHead setelah dikurang 1 (arah ke kiri) % cols == cols -1
    else if (direction == -1 && newHead % cols == cols - 1) {
      //newhead 0 %20 = 19 siapa sangka wowowowwo
      newHead = newHead + cols;
    }
    //kalau ke atas udah di grid yang kurang dari 0
    //misal udah sampai grid 0 dengan arah atas -20 kan totalnya -20 < 0
    //biar dia balik lagi diambahin total grid di sini 400
    //jadi - 20 + 400 = jadi 380 itu grid pertama di baris terakhir
    else if (newHead < 0) {
      newHead = newHead + (cols * rows);
    }
    //kalau di grid yang di bawah pasti udah di grid yang lebih dari 400 atau total dari semua grid cols * rows
    else if (newHead > cols * rows) {
      newHead = newHead - (rows * cols);
    }
    // } else if (newHead<0){
    //   //kalau bagian kepala di posisi grid kurang dari batas atas, karena row atas tuh terdiri dari grid 1-20 kalau kurang dari itu artinya dia udah lewat
    // }else if (newHead > rows * cols){
    //   //kalau kepala lebih dari kotak ke 400, baris terakhir itu ada 379-400 lah gitu lebih dari itu artiny dah lewat
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

  void changeDirection(int newDirection) {
    // kalau direction sekarang misal -1 trus dapat input direction jadi 1
    // nanti jadi -1 +1 jadi nol dan enggak gerak
    if (direction != newDirection * (-1)) {
      direction = newDirection;
    }
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
                    itemCount: cols * rows, //jadi total ada 400 kotak
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols, // satu baris ada 20 kotak
                    ),
                    itemBuilder: (context, index) {
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
                              isSnake
                                  ? Colors.green
                                  : isFood
                                      ? Colors.red
                                      : Colors.grey,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    startGame();
                  },
                  child: Text("Mulai")),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    changeDirection(-20);
                  },
                  child: Text("atas")),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        changeDirection(-1);
                      },
                      child: Text("kiri")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        changeDirection(1);
                      },
                      child: Text("kanan")),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    changeDirection(20);
                  },
                  child: Text("bawah")),
            ],
          ),
        ));
  }
}
