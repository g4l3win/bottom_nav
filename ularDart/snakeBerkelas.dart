import 'dart:async';
import 'dart:math';
import 'dart:io';

class gambar {
  int sumbuX = 10;
  int sumbuY = 10;

  void drawGame(List<List<int>> ular, List<int> makanan) {
    for (int y = 0; y < sumbuY; y++) {
      for (int x = 0; x < sumbuX; x++) {
        // Cek apakah ada bagian ular di posisi (x, y)
        bool isUlar = ular.any((pos) => pos[0] == x && pos[1] == y);

        if (isUlar) {
          stdout.write('O'); // Gambar ular
        } else if (makanan[0] == x && makanan[1] == y) {
          stdout.write('X'); // Gambar makanan}
        } else {
          stdout.write('.'); // Gambar latar
        }
      }
      stdout
          .writeln(); // Pindah ke baris baru setelah satu row selesai stdout.writeln( "/n ")
    }
    stdout.writeln("--------------------------");
  }
}

class ularr {
  List<List<int>> ular = [
    [5, 4], // Kepala ular
    [5, 5], // Badan
  ];

  //  print(ular[0][0]); //keluar kiri atas
  // print(ular[0][1]);//keluar kanan atas
  // print(ular[1][0]);// keluar kiri bawah
//  print(ular[1][1]); //keluar kanan bawah

  List<int> arah = [0, -1]; // Mulai [1,0] kanan [-1,0] kiri [0,-1] keatas [0,1] kebawah
  List<int> makanan = [5, 3]; // Posisi awal makanan

  void gerakUlar(int sumbuX, int sumbuY) {
    // print("Ular bergerak ke arah ($arah.first, $arah.last)");
    // Buat kepala baru berdasarkan arah
    List<int> kepala = [ular.first[0] + arah[0], ular.first[1] + arah[1]];
    bool isMain = true;
    //    print(ular[0].first);//luar kiri atas
    // print(ular[0].last); //keluar kanan atas

    // print("/n");
//  kepala = [ular[0].first,
//            ular[0].last
    //           ];

//      print(ular.first[0]); //ular dapat indeks ke satu indeks ke 0 sama kayak ular[0].first,
//  print(ular.first[1]); //dapat data pertama indeks [1,4] tapi karena fisrt[1] jadi diapat data 4 sama kayak ular[0].last

    // Jika keluar batas, teleportasi ke sisi lain
    if (kepala[0] >= sumbuX) kepala[0] = 0;
    if (kepala[0] < 0) kepala[0] = sumbuX - 1;
    if (kepala[1] >= sumbuY) kepala[1] = 0;
    if (kepala[1] < 0) kepala[1] = sumbuY - 1;

    // Cek apakah menabrak badan sendiri
    // if (ular.any((pos) => pos[0] == kepala[0] && pos[1] == kepala[1])) {
    //   isMain = false;
    //   return;
    // }

    //cara ngecek pakai for loop sederhana 
for(int i= 0 ; i<ular.length; i++){
        if(ular[i][0]==kepala[0]&& ular[i][1] == kepala[1]){
                isMain = false;
                return;
        }
}

    // Masukkan kepala baru
    ular.insert(0, kepala);

    // Jika makan makanan, jangan hapus ekor
    if (kepala[0] == makanan[0] && kepala[1] == makanan[1]) {
      Random random = Random();
      makanan[0] = random.nextInt(sumbuX);
      makanan[1] = random.nextInt(sumbuY);
    } else {
      ular.removeLast(); // Hapus ekor
    }
  }
}

class InputHandler {
  // ularr ular;
  //
  // InputHandler(this.ular);

  void handleInput(String key, List<int> arah) {
    if (key == 'w' && arah[1] != 1) {
      // Ke atas (tidak bisa balik ke bawah)
      arah[0] = 0;
      arah[1] = -1;
    } else if (key == 's' && arah[1] != -1) {
      // Ke bawah
      arah[0] = 0;
      arah[1] = 1;
    } else if (key == 'a' && arah[0] != 1) {
      // Ke kiri
      arah[0] = -1;
      arah[1] = 0;
    } else if (key == 'd' && arah[0] != -1) {
      // Ke kanan
      arah[0] = 1;
      arah[1] = 0;
    }
  }
}

void main() {
 ularr snake = ularr();
 gambar gambarGame = gambar();
 InputHandler inputKey = InputHandler();

  // Listen untuk menerima input dari keyboard
  stdin.lineMode = false; // Non-line mode biar langsung deteksi tombol
  stdin.echoMode = false; // Non-echo mode biar gak nge-print input
  stdin.listen((List<int> event) {
    var key = String.fromCharCode(event.last);
    inputKey.handleInput(key, snake.arah);
  });

  Timer.periodic(Duration(milliseconds: 200), (timer) {
    // print('\x1B[2J\x1B[0;0H');
    gambarGame.drawGame(snake.ular, snake.makanan);
    snake.gerakUlar(gambarGame.sumbuX, gambarGame.sumbuY);

  });


}
