import 'package:flutter/material.dart';
import 'package:flame_ular/game/snakeGame.dart';

class GameOverScreen extends StatelessWidget {
  final snakeGame game;
  const GameOverScreen(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                game.reset();
                game.overlays.remove('GameOver');
              },
              child: Text("Restart",
                style: TextStyle(fontSize: 40),),
            ),
          ],
        ),
      ),
    );;
  }
}
