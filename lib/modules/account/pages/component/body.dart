import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/account/pages/component/textbox.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tambah pengguna baru latihan pakai textbox
        SizedBox(height: 20,),
        Text("Tambah pengguna baru", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18),
        ),
        SizedBox(height: 20,),
        //ini textboxnya
        Textbox(label: "Nama Pengguna",),
        Textbox(label: "Email",),
        Textbox(label: "Tanggal lahir",),
        Textbox(label: "Handphone",),
        Textbox(label: "Tinggi",),
        Textbox(label: "Berat",),
        //button
        SizedBox(
          width: double.infinity, //biar selebar parent container
          child: ElevatedButton(
              onPressed: ()=> Get.snackbar(
                "Sukses", // Judul snackbar
                "User baru telah ditambahkan!", // Isi pesan
                snackPosition: SnackPosition.BOTTOM, // Posisinya di bawah
                backgroundColor: Colors.green, // Warna background
                colorText: Colors.white, // Warna teks
                borderRadius: 8,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 2), // Snackbar muncul selama 2 detik
                icon: Icon(Icons.check_circle, color: Colors.white), // Ikon di snackbar
              ),
              child: Text("Tambah",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Menambahkan border radius untuk sudut melengkung
                  side: BorderSide(
                    color: Colors.grey, // Warna border
                    width: 1, // Ketebalan border
                  ),
                ),
                //padding dalam button
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              )),
        )
      ],

    );
  }
}
