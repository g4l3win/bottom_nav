import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flame_ular/game/snakeGame.dart';
import 'package:flutter/services.dart';

class Ular extends PositionComponent with HasGameRef<snakeGame>{
  List<Vector2> body;
  Vector2 direction = Vector2(1, 0);
  final int gridSize;
  final double cellSize;
  double timer = 0;
  final double speed = 1.0;

  Ular(this.gridSize, this.cellSize) : body = [Vector2(5, 5), Vector2(4, 5)];

  void changeDirection(LogicalKeyboardKey key) {
    //direction.y == 0 dan direction.x == 0 mencegah ular berputar 180 derajat
    if (key == LogicalKeyboardKey.arrowUp && direction.y == 0) {
      //misal lagi keatas jadi arahnya (0,-1)
      //arah ular sebelumnya boleh (1,0) ke kanan, (-1,0) ke kiri
      //tapi enggak boleh (0,1) karena itu lagi ke kebawah
      //karena yang diperbolehkan dia bergerak sumbu y nya lagi angka 0 semua
      //makanya syarat boleh arrow up itu harus sumbu y nya lagi nol
      direction = Vector2(0, -1);
    } else if (key == LogicalKeyboardKey.arrowDown && direction.y == 0) {
      direction = Vector2(0, 1); // kalau mau kebawah g boleh aray sebelumnya lagi (0,-1)
    } else if (key == LogicalKeyboardKey.arrowLeft && direction.x == 0) {
      direction = Vector2(-1, 0); //kalau lagi ke kiri enggak boleh arah sebelumnya lagi ke kanan (1, 0)
    } else if (key == LogicalKeyboardKey.arrowRight && direction.x == 0) {
      direction = Vector2(1, 0); //kalau lagi ke kanan tidak boleh arah sebelumnya ke kiri (-1,0)
    }
  }
//ular dipanggil terus setiap frame (1 frame 0,167 sekian)
  //
  @override
  void update(double dt) {
   // print("nilai awal ${dt}"); //bakal dapat 0,0166667 soalnya game bergerak dalam 60 FPS
    timer += dt;
    //print("nilai now ${timer}");
    ///contoh timer 0 speednya 1
    ///if timer = 0 ular g jalan + 0,0167
    ///if timer = 0,0167 ular g jalan + 0,0167
    /// fungsi update akan nambah terus si timernya dengan inkremen 60FPS
    /// if timer = 1,00sekian ular jalan pakai fungsi move() trus timer direset lagi jadi nol
    if (timer >= speed) {
      timer = 0;
      move();
    }
  }

  void move() {
    Vector2 newHead = body.first + direction;
    // print('Snake Head: ${newHead.x}, ${newHead.y}');
    // print('Food Position: ${gameRef.food.position.x/20}, ${gameRef.food.position.y/20}');

    if (body.contains(newHead)) {
      gameRef.overlays.add('GameOver');

      //return;
    }
    ///menangani efek wrap around, biar muncul lagi di sisi berlawanan kalau udah nembus
    //misal ular keluar ke kanan berarti si newHead kepala ada di dalam grid 20x20
    //newHead sumbu x nya sekarang ada di (20,1)
    //biar nilai 20 nya jadi 0 lagi
    //20 modulus 20 sisa baginya nol
    //jadinya si newHead.x sekarang nilainya 0 lagi

    //ditambah gridSize
    // JADI Misal ke kiri dan udah out of bound nilainya newHead.x -1
    //-1 + 20 = 19 % 20 sisa baginya 19 soalnya 19 g bisa dibagi 20
    //jadi posisi baru sumbu xnya jadi 19
    newHead.x = (newHead.x + gridSize) % gridSize;
    newHead.y = (newHead.y + gridSize) % gridSize;

    body.insert(0, newHead);
    if (newHead == gameRef.food.position) {
      gameRef.food.spawn(body);
    } else {
      body.removeLast();
    }
  }
//void render dipakai untuk menggambar objek pada layar menggunakan Canvas pada flutter flame
  //dibawah buat gambar badan ular kotak
  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.green; //ini paint untuk kasih warna
    for (final segment in body) { //loop yang melalui setiap badan ularnya di dalam list body
      //left sumbu x kali 1 baris kan ada 20 grid
      //jadi biar pas posisi topnya koordinat left * 20
      //pake gambar aja susah jelasin pakai kata kata
      //dua parameter belakang buat ngatur panjang dan lebar dari kotak nya
      canvas.drawRect(
        Rect.fromLTWH(segment.x * cellSize, segment.y * cellSize, cellSize, cellSize),
        paint,
      );
    }
  }

}

//  Ular(Vector2 position):
//      super(position: position,
//      size: Vector2(30, 30),
//  paint: Paint()..color = const Color(0xFF00FF00), // Warna hijau
// );


///kalau mau nambah text begini
// class Ular extends TextComponent {
//   late TextComponent tulisan;
//   Ular({super.position}) :
//         super(size: Vector2.all(200), anchor: Anchor.center);
//
//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//    //teks place holder
//     tulisan = TextComponent(
//     text:"ini player ular",
//     textRenderer: TextPaint(
//       style: TextStyle(fontSize: 20),
//
//     )
//     );
//     add(tulisan);
//   }
// }

// final GridMap gridMap;
// List<Vector2> body = []; //menyimpan posisi badan ular
// int directionX = 0; //DEFAULT gerak ke kanan
// int directionY = -1;
// double moveTimer =0;
//
//
// Ular(this.gridMap) {
//   print('run 2');
//   size = Vector2(20, 20);
//   body.add(gridMap.getPosition(-4, -4)); // Posisi awal ular
//   print('ular length' + body.length.toString());
//   print("curr pos Length: ${body.length} | Body: $body");
//   paint = Paint()..color = Colors.green; // Atur warna dengan paint rectangleComponent enggak punya properti color langsung
//   add(RectangleHitbox());
// }
//
// //void untuk ganti arah
// void changeDirection(int dx, int dy){
//   if(directionY != dy*(-1) && directionX != dx*(1)){
//     directionX = dx;
//     directionY = dy;
//   }
// }
//
// void move(){
//   //ambil posisi kepala ini penyakit
//   Vector2 head = body.first;
//   Vector2 newPosition = gridMap.getPosition(
//       (head.x / gridMap.cellSize).toInt() + directionX,
//       (head.y / gridMap.cellSize).toInt() + directionY
//   );
//   //kayak masukkin insert newHead ke dalam listBody
//   body.insert(0, newPosition);
//   //hapus ekor biar keliatan kayak jalan
//
//   @override
//   void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
//     super.onCollisionStart(intersectionPoints, other);
//
//     if (other is makanan) {
//       other.spawnFood();
//     }else{
//       body.removeLast();
//     }
//   }
//   // shrink();
//    updateBody();
//   // print("Body Length: ${body.length} | Body: $body");
//
// }
//
// //void jangan remove last
// // void grow(){
// //    Vector2 tail = body.last;
// //    Vector2 newTail = Vector2.copy(tail); // Salin posisi ekor
// //   body.add(newTail); // Tambahkan di belakang
// //   print('dia makan ${body.length.toString()}');
// //   updateBody();
// // }
// //
// // void shrink(){
// //   if(body.length>1){
// //     body.removeLast();
// //   }
// // }
//
// @override
// void update(double dt){
//   if (!gameRef.isMounted) return;
//
//   //biar timer nambah terus
//   moveTimer += dt;
//   if(moveTimer >=0.5){
//     move();
//     moveTimer = 0;// direset lagi kalau udah sampai batas wakti 1 detik
//   }
//   position = body.first;
//
// }
//
// void updateBody(){
//   // children.clear(); // Hapus tampilan lama
//   // print('current ${body}');
//   //
//   // print('harusnya kalau gerak sama kayak body ${directionX}');
//   // print('harusnya kalau gerak sama kayak body');
//   //
//   // Vector2 lastVector = body.last;
//   // print('ynya s brapa ${lastVector.y}');
//   // print('xnya s brapa ${lastVector.x}');
//   //
//   // lastVector.y -= 20;
//   // lastVector.x -= 20;
//   //
//   // print('ynya e brapa ${lastVector.y}');
//   // print('xnya e brapa ${lastVector.x}');
//   //
//   // add(RectangleComponent(
//   //   position: lastVector,
//   //   size: Vector2(20, 20),
//   //   paint: Paint()..color = Colors.blue,
//   // ));
//
//   for (var segment in body) {
//     add(RectangleComponent(
//       position: segment,
//       size: Vector2(20, 20),
//       paint: Paint()..color = Colors.blue,
//     ));
//   }
// }