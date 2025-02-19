import 'dart:ffi';

import 'package:flame/components.dart';
import 'package:inputkey/constants.dart';
import 'dart:math';

//enum sekumpulan nilai tetap yang digunakan untuk mengurangi kesalahan user
//jadi cuma bisa dapat nilai yang udah didefinikan sama programmer
enum ObstacleType{
  one,
  two,
  image
}

class ObstacleData{
  final Vector2 position;
  final ObstacleType type;

  ObstacleData ({required this.position, required this.type});
}
class LevelData{
  final obstacleSpacing = obstacleSize + (playerHeight *2);
  final leftSide = -(gameWidth/2) + (obstacleSize/2);
  final rightSide = (gameWidth/2) - (obstacleSize/2);
  //randoommm
  final Random random = Random();
//cara ngerandom
  ///1 pakai random untuk memilih jumlah item tiap row misal ada item 1-5
  ///pakai random biar tahu item mana yang mau muncul dari obstacleType
  ///pakai set<int> biar posisi item dalam 1 row g duplikat. jadi jangan item 1 dua kali
  ///buat loop untuk generate beberapa row secara otomatis
//


  ///fungsi untuk generate random row
  ///buat list content yang bentuknya sesuai objek dari obstacle data
  /// buat variabel untuk nampung angka random berapa banyak item di dalam row var itemCount
  /// list untuk menyimpan posisi unik. kalau udah sampai batas maksimum itemCount dia stop masukkun ke setLIst
  ///kalau angka randomnya udah pernah dimasukkin jangan masukkin lagi ke dalam setList
  ///looping buat masukkin set list ke dalam randomType
///buat loop untuk mengenerate beberapa row secara otomatis
///

  List<ObstacleData> generateRandomlevel(int totalRows){
    List<ObstacleData> level =[];
    //masukkin data ke dalam list level
    for(int i =0; i<totalRows; i++){
      level.addAll(generateRandomRow(i));
    }
    return level;
  }
  List<ObstacleData> generateRandomRow(int row){
    final yPosition = obstacleSpacing * (row + 2.0);

    List<ObstacleData> content = [];//nampung hasil
    int itemCount = random.nextInt(5); //ini cuma buat tahu dalam 1 baris ada berapa item
    //set posisi unik item dalam 1 row
    Set<int> posisiUnik ={};

    // for(int i =0; i<itemCount; i++){
    //   int randomItem = random.nextInt(5)+1;
    //   posisiUnik.add(randomItem);
    // }
    ///selama total jumlah elemen tidak lebih dari itemCount
    ///misal dirandom itemCount 3
    ///randomITEM 3 angka pertama 2,3,3
    ///yang masuk ke setlist posisiUnik baru 2,3 jadi baru panjangnya 2, makanya dilooping lagi
    ///misal randomItem ke-4 itu angka 1, baru bisa masuk ke posisiUnik
    while (posisiUnik.length <itemCount) {
      //random angka lagi buat nentuin item yang dimasukkin yang nomor berapa aja
      //misal kan ada itemCount diradom 3. trus di random lagi di dalam 3 item itu di posisi berapa aja
      //item 1, 4,5 gitu
      //variabel nampung random lagi
      int randomItem = random.nextInt(5) + 1;

      ///kayak gini salah, yang dimasukkin malah yang item yang udah ada sedangkan setList enggak bisa terima list yang g unik
      // if (posisiUnik.contains(randomItem)) {
      //   posisiUnik.add(randomItem);
      // }

      posisiUnik.add(randomItem);
    }
    ///yang ini bisa kalau item random dapat 3, trus angka randomnya 2,3,3
    ///sedangkan angka di posisi unik g boleh sama jadi yang diinput cuma 2,3
    ///jadi posisiUnik.length<itemCount
    ///tambah loop tambahan biar posisi unik biar elemen yang masuk cukup

    //LOOPING buat masukkin obstacle jenis apa/obstacleType mana yang mau dimasukkin ke dalam list content akhir

      for(int i =0; i<posisiUnik.length; i++){
        ObstacleType randomType = ObstacleType.values[random.nextInt(3)]; //soalnya di dalam obstacleType cuma ada 3 value
        content.add(ObstacleData(position: getPosition(posisiUnik.elementAt(i), yPosition), type: randomType));
      }
    return content;
    }


  Vector2 getPosition(int index, double yPosition){

    if(index ==1 ){
      return Vector2(leftSide, yPosition);
    } else if(index ==2){
      return Vector2(leftSide+(gameWidth/5), yPosition);
    } else if(index ==3 ){
      return Vector2(0, yPosition);
    } else if(index==4){
      return Vector2(rightSide-(gameWidth/5), yPosition);
    }
    else if(index==5){
      return Vector2(rightSide, yPosition);
    }else {
    return Vector2(0, 0);
    }

  }
}

//List<ObstacleData> level1(){
//     List<ObstacleData> level =[];
//
//     level.addAll((obstacleRow(
//       row: 0,
//       item1: ObstacleType.two,
//       item2: ObstacleType.one,
//       item4: ObstacleType.image,
//       item5: ObstacleType.one,
//     )));
//     level.addAll((obstacleRow(
//       row: 1,
//       item2: ObstacleType.one,
//       item5: ObstacleType.one,
//     )));
//     level.addAll((obstacleRow(
//       row: 2,
//       item3: ObstacleType.two,
//       item4: ObstacleType.image,
//     )));
//     level.addAll((obstacleRow(
//       row: 3,
//       item1: ObstacleType.image,
//     )));
//     level.addAll(obstacleRow(
//       row: 5,
//       item4: ObstacleType.one,
//       item5: ObstacleType.two,
//     ));
//     return level;
//   }
// //soalnya 1 row ada 5 items
//   List<ObstacleData> obstacleRow({
//     required int row,
//     ObstacleType? item1,
//     ObstacleType? item2,
//     ObstacleType? item3,
//     ObstacleType? item4,
//     ObstacleType? item5,
//   }){
//     List<ObstacleData> content =[];
//     final yPosition = obstacleSpacing * row; //kasih spacing antar row dari obstacle
// //karena ini masih 1 row semua makananya posisi tiap item di y position itu sama semua
//     if(row <0 || row>14){
//       throw Exception("Row is out of range must be between 0..14");
//     }
//     if(item1 != null){
//       content.add(
//         ObstacleData(//mepet kiri
//             position: Vector2(leftSide, yPosition),
//             type: item1),
//       );
//     }
//     if(item2 != null){
//       content.add(
//         ObstacleData(//mepet kiri + 1/5 dari lebar layar game
//             position: Vector2(leftSide+(gameWidth/5), yPosition),
//             type: item2),
//       );
//     }
//     if(item3 != null){
//       content.add(
//         ObstacleData( //pas tengah
//             position: Vector2(0, yPosition),
//             type: item3),
//       );
//     }
//     if(item4 != null){
//       content.add(
//         ObstacleData( //ke kanan trus kuraning 1/5 dari sisi kanan
//             position: Vector2(rightSide-(gameWidth/5), yPosition),
//             type: item4),
//       );
//     }
//     if(item5 != null){
//       content.add(
//         ObstacleData( //mepet kanan
//             position: Vector2(rightSide, yPosition),
//             type: item5),
//       );
//     }
//     return content;
//   }
