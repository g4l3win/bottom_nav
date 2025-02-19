import 'package:flame/components.dart';
import 'dart:math';

//deklarasi ukuran baris dan kolom grid
//menentukan posisi objek makanan dan ular
class GridMap{
    //kolom dan baris dari grid enggak berubah
  //ditentuin dari awal ukuran grid nya berapa kali berapa
  final int cols;
  final int rows;
  late List<List<String>> grid; //ini matrix tempat main. pakai late untuk kasih tahu kalau variabel bakal diisi belakangan
  double cellSize; //ukuran 1 sel dalam layar

//buat konstruktor
  GridMap(this.cols,
      this.rows, this.cellSize){
    _initializeGrid();
  }

  //syntax list generate fungsi buat list dengan panjang posisi dan mengisi nilai sesuai dengan generator untuk setiap index
  // dimulai dari range 0 sampai angka int length
  // List<E>.generate(
  //     int length,
  //     E generator( int index ), {
  //       bool growable = true,
  //     })
  //final growableList =
  //     List<int>.generate(3, (int index) => index * index, growable: true);
  // print(growableList); // [0, 1, 4]
  //buat fungsi _initializeGrid()
  void _initializeGrid(){
    grid = List.generate(rows, (_) => List.generate(cols,(_)=> "."));
  }

  //konversi posisi grid ke posisi layar
//soalnya di flame pakai koordinat berbasis pixel, sedangkan grid area main ular pakainya kartesian
//cellSizenya kita atur sendiri
//kalau cellSizenya 50
//geser ke kanan (1,0) artinya geser (50,0)
//geser ke bawah (0,1) artinya geser (0,50)
//1 = 50
Vector2 getPosition(int cols, int rows){
    return Vector2(cols*cellSize, rows*cellSize);
}

//void untuk memunculkan makanan
void spawnFood(){
    Random random = Random();
    int foodX = random.nextInt(cols);
    int foodY = random.nextInt(rows);
    //masukkin indeks matriks makanan randomnya
  grid[foodX][foodY] = "X";
}
}