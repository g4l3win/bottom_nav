import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/navigation/routes.dart';

class Button extends StatelessWidget {
  //variabel icon
  final IconData icon;
  //variabel tulisan label
  final String label;
  //variabel route
  final String rute;

  const Button({Key? key,
  required this.icon,
  required this.label,
  required this.rute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Row(
          //kasih Main axis alignment

          mainAxisAlignment: MainAxisAlignment.spaceBetween, //ngatur jarak antar icon dan teks
          children: [
            //icon kiri
            Icon( icon,
              color: Colors.black,), //NANTI DIGANTI GANTI
            //tulisan
            Text(label, style: TextStyle(fontSize: 15
            ),),
            //icon panah kanan
            Icon(Icons.arrow_forward,
              color: Colors.black,),
          ],
        ),
        onPressed: () => Get.toNamed(rute),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Menambahkan border radius untuk sudut melengkung
            side: BorderSide(
              color: Colors.grey, // Warna border
              width: 1, // Ketebalan border
            ),
          ),
          //padding dalam button
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        )
    );
  }
}
