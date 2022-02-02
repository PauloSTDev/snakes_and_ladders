import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  print("Load the game Widgets");
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  SpriteComponent background = SpriteComponent();
  SpriteComponent backgroundBoard = SpriteComponent();
  SpriteComponent player1 = SpriteComponent();
  SpriteComponent player2 = SpriteComponent();

  @override
  Future<void> onLoad() async{
    super.onLoad();
    print("Load Game Assets");

    background
    ..sprite = await loadSprite("background.png")
    ..size = Vector2(700,370);
    add(background);

    player1
      ..sprite = await loadSprite("player1.png")
      ..size = Vector2(25,25)
      ..x = 180
      ..y = 305;
    add(player1);

    player2
      ..sprite = await loadSprite("player2.png")
      ..size = Vector2(25,25)
      ..x = 190
      ..y = 310;
    add(player2);
  }
}