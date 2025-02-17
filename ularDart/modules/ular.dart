import 'makanan.dart'; //biar bisa pakai fungsi spawnFood
import 'dart:async';
class ular{
  //grid itu kotak 20*20 jadi indeksnya 0-399
  //badan ular itu list dari indeks grid. badan ular cuma ada dua kotak grid
  List<int> snake = [42, 41];
  int direction = 1;

  void moveSnake(int cols, int rows,Food makanan) {
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

      return;
    }
    else if(direction ==1 && newHead % cols == 0){ //mentok dinding kanan
      newHead = newHead -20;
    }
    else if(direction ==-1 && newHead % cols == cols-1){//mentok dinding kiri
      newHead = newHead+20;
    }else if(newHead<0){
      newHead = newHead + (cols*rows);
    }else if(newHead > cols*rows){
      newHead = newHead - (cols * rows);
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
    if (newHead == makanan.food) {
      makanan.spawnFood(cols, rows);
    } else {
      snake.removeLast();
    }
  }
}