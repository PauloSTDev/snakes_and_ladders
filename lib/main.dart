import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

void main() {
  print("Load the game Widgets");
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with HasTappables{

  SpriteComponent background = SpriteComponent();
  SpriteComponent player1 = SpriteComponent();
  SpriteComponent player2 = SpriteComponent();
  PlayerButton1 playerButton1 = PlayerButton1();
  PlayerButton2 playerButton2 = PlayerButton2();
  final Vector2 buttonSize = Vector2(50.0, 50.0);
  SpriteComponent buttonPlayDisabled = SpriteComponent();
  SpriteAnimationComponent player1Animation = SpriteAnimationComponent();
  SpriteAnimationComponent player2Animation = SpriteAnimationComponent();

  final double playerSize = 30;
  bool turnPlayer1 = true;
  bool turnPlayer2 = false;

  @override
  Future<void> onLoad() async{
    super.onLoad();
    print("Load Game Assets");
    add(background
      ..sprite = await loadSprite("background.png")
      ..size = size);

    player1
      ..sprite = await loadSprite("player1.png")
      ..size = Vector2(playerSize,playerSize)
      ..x = size[0]/4+5
      ..y = size[1]/1.2-5;
    add(player1);

    player2
      ..sprite = await loadSprite("player2.png")
      ..size = Vector2(playerSize,playerSize)
      ..x = size[0]/4+9
      ..y = size[1]/1.2;
    add(player2);

    playerButton1
      ..sprite = await loadSprite("play.png")
      ..size = buttonSize
      ..position =
      Vector2(
          size[0]/6,
          size[1]/8);

    playerButton2
      ..sprite = await loadSprite("play.png")
      ..size = buttonSize
      ..position =
      Vector2(
          size[0]/1.28,
          size[1]/8);

    buttonPlayDisabled
      ..sprite = await loadSprite("play_disabled.png")
      ..size = buttonSize
      ..position =
      Vector2(
          size[0]/1.28,
          size[1]/8);

    var spriteSheet1 = await images.load("player1_animation.png");
    var spriteSheet2 = await images.load("player2_animation.png");
    final spriteSize = Vector2(playerSize, playerSize);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(amount: 3, stepTime: 0.3, textureSize: Vector2(190, 300));

    final Vector2 positionPlayer1 = Vector2(size[0]/4+5, size[1]/1.2-5);
    player1Animation =
        SpriteAnimationComponent.fromFrameData(spriteSheet1, spriteData)
    ..size = spriteSize
          ..position = positionPlayer1;
    //add(player1Animation);

    final Vector2 positionPlayer2 = Vector2(size[0]/4+10, size[1]/1.2+5);
    player2Animation =
    SpriteAnimationComponent.fromFrameData(spriteSheet2, spriteData)
      ..size = spriteSize
    ..position = positionPlayer2;
    //add(player2Animation);
  }

  @override
  void update(double dt){
    super.update(dt);
    add(playerButton1);
    add(buttonPlayDisabled);
  }
}
class PlayerButton1 extends SpriteComponent with Tappable {
  @override
  bool onTapDown(TapDownInfo event) {
    try {
      print("We will move to next screen");
      return true;
    }
    catch(error){
      print(error);
      return false;
    }
  }

}

class PlayerButton2 extends SpriteComponent with Tappable {
  @override
  bool onTapDown(TapDownInfo event) {
    try {

      print("We will move to next screen");
      return true;
    }
    catch(error){
      print(error);
      return false;
    }
  }
}