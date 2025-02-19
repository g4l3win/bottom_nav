import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/painting.dart';

class makanan extends RectangleComponent{
  makanan(Vector2 position):
        super(position: position,
        size: Vector2(30, 30),
        paint: Paint()..color = const Color(0xFFFF0000), // Warna merah
      );


}