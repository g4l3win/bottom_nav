import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/widgets.dart';
import 'gameApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //memanggil jika ada operasi async yang butuh binding flutter
  Flame.device.fullScreen();///biar full screen jadi immersive
  Flame.device.setPortrait();// biar kalau auto rotate dia enggak ikut ke rotate landscape
  runApp(const GameApp());
}

