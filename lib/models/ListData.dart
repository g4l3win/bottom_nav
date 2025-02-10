//ambil data JSON dari API mayora

//objek class list data{
class ListData {
  String? materialname; //ini buat list yang diatas
  String? shiftcode; // ini yang buat list yang dibawah


  ListData(
      {this.materialname, this.shiftcode});
//fromJSON itu method untuk mengubah JSON menjadi objek dalam dart
  ListData.fromJson(Map<String, dynamic> json) {

    materialname = json['MATERIALNAME'] ?? "-";
    shiftcode = json['SHIFTCODE'] ?? "-";

  }
}
