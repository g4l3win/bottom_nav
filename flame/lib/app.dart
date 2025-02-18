import 'package:flutter/material.dart';
import 'package:inputkey/constants.dart';
import 'package:inputkey/game/go_green_game.dart';
import 'package:flame/flame.dart';
import 'package:flame/widgets.dart'; // Tambahkan ini jika perlu
import 'package:flame/game.dart';
import 'constants.dart';

class GameApp extends StatefulWidget {
  const GameApp({Key? key}) : super(key: key);

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final GoGreenGame game;
  @override
  void initState(){
    super.initState();
    game = GoGreenGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.yellow
      ),
      home: Scaffold(
        body: SafeArea(
          child:
          Center(
            child: FittedBox(
              child: SizedBox(
                  width: gameWidth,
                  height: gameHeight,
                  child: GameWidget(game: game)),
            ),
          ),
        )
      ),
    );
  }
}
