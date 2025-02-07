import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselTile extends StatelessWidget {
//terima variabel nama asset gambar
final String image;

  const CarouselTile({Key? key,
  required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Atur lebar setiap item
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: Center(
          child: Image.asset(image)),
    );
  }
}
