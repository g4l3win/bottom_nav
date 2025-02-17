import 'dart:async';

class Board {
  //variabel
  //keperluan grid tampilan
  int rows = 20; //jumlah baris dalam grid
  int cols = 20; // jumlah kolom dalam grid
  int speed = 600; // dalam milisecond

  bool isPlaying = false; //bikin kondisi benar lagi main
  //timer untuk menggerakkan ular
  Timer? gameLoop;
}

