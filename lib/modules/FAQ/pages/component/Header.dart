import 'package:bottom_nav/modules/FAQ/controller/FAQ_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bottom_nav/modules/FAQ/pages/component/CarouselTile.dart';

class Header extends GetView<FAQController>{
  //const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container di belakang (setengah dari tinggi gambar)
        Positioned(
          bottom:
          125, // Setengah dari tinggi gambar (250/2) dari atas
          left: 0,
          right: 0,
          child: Container(
            height: 125, // Setengah dari tinggi gambar
            color: Colors.yellow[800], // Warna background
          ),
        ),

        // ListView dengan gambar di atasnya
        Container(
          height: 250, // Tinggi gambar
          child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              var gambar = controller.images[index];
              return CarouselTile(image: gambar);
            },
          )),
        ),
      ],
    );
  }
}
