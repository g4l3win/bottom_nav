import 'package:flutter/cupertino.dart';
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
  void initState() {
    super.initState();
    game = GoGreenGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.yellow),
      home: Scaffold(
          body: SafeArea(
        child: Center(
          child: FittedBox(//scale child supaya tetap muat di dalam paretnya tanpa overflow
            child: SizedBox(
                width: gameWidth,
                height: gameHeight,
                child: GameWidget(
                    game: game,
                    //didalam gameWidget bisa kasih
                    overlayBuilderMap: {
                      'gameOver': (context, game) {
                        final goGreenGame = game as GoGreenGame;

                        if (goGreenGame.isGameOver) {
                          return Center(
                            child: Container(
                              height: 500,
                              width: 500,
                              color: Colors.black,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(top:50),
                                      child: Text("GAME OVER", style: TextStyle(fontSize: 50, color: Colors.white))),
                                  SizedBox(height: 30),
                                  ElevatedButton(
                                    onPressed: () {
                                      goGreenGame.overlays.remove('gameOver');
                                      goGreenGame.resumeEngine();
                                      goGreenGame.reset();
                                    },
                                    child: Text("Restart",
                                    style: TextStyle(fontSize: 40),),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return SizedBox(); // Fallback jika tidak ada overlay
                      }
                    }
                    )),
          ),
        ),
      )),
    );
  }
}
