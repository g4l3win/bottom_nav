import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'constants.dart';
import 'game/snakeGame.dart';
import 'game/gameOverScreen.dart';

class GameApp extends StatefulWidget {
  const GameApp({Key? key}) : super(key: key);

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final snakeGame game;
  @override
  void initState() {
    super.initState();
    game = snakeGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.grey),
      home: Scaffold(
          body: SafeArea(
        child:
        Stack(
          children: [
            Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  //scale child supaya tetap muat di dalam paretnya tanpa overflow
                  child: SizedBox(
                      width: gameWidth,
                      height: gameHeight,
                      child: GameWidget(
                        game: game,
                        overlayBuilderMap: {
                          'GameOver': (context, game){
                            //harus dikonversi
                            return GameOverScreen(game as snakeGame);
                          }
                        },
                      )),
                ),
                SizedBox(height: 15),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            game.changeSnakeDirection(1);
                          },
                          child: Text("Atas"),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                game.changeSnakeDirection(2);
                              },
                              child: Text("Kiri"),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                game.changeSnakeDirection(3);
                              },
                              child: Text("Kanan"),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            game.changeSnakeDirection(4);
                          },
                          child: Text("Bawah"),
                        )
                      ],
                    ),

              ],
            ),

          ]
        ),
      )),
    );
  }
}
