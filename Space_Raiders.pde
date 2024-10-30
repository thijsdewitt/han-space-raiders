import gifAnimation.*;
import processing.sound.SoundFile;

final int SCREEN_START = 0;
final int SCREEN_GAME_SETUP = 1;
final int SCREEN_GAME = 2;
final int SCREEN_END = 3;
final int SCREEN_HIGHSCORES = 4;
final int SCREEN_WIN = 5;
final int SCREEN_TUTORIAL = 6;

// default scale factor for assets (default 16x16); will be recalulcated on setupGameScreen
float SCALE = 4;
float UNIT = 16 * SCALE;

int screen = SCREEN_START;

void setup() {
  size(1200, 900);
  noSmooth();
  fullScreen(2);

  setupAssets();
  setupStartScreen();
}

void draw() {
  switch(screen) {
  case SCREEN_START:
    drawStartScreen();
    break;
  case SCREEN_GAME_SETUP:
    drawGameSetupScreen();
    break;
  case SCREEN_GAME:
    drawGameScreen();
    break;
  case SCREEN_END:
    drawEndScreen();
    break;
  case SCREEN_HIGHSCORES:
    drawHighScoresScreen();
    break;
  case SCREEN_WIN:
    drawWinScreen();
    break;
  case SCREEN_TUTORIAL:
    drawTutorialScreen();
    break;
  default:
    drawGameSetupScreen();
    break;
  }
}

void mouseClicked() {
  // setupPlayer1();
  // setupWinScreen(1);
  // screen = SCREEN_WIN;
  switch(screen) {
  case SCREEN_START:
    mouseClickedStartScreen();
    break;
  case SCREEN_GAME_SETUP:
    mouseClickedGameSetupScreen();
    break;
  case SCREEN_GAME:
    mouseClickedGameScreen();
    break;
  case SCREEN_END:
    mouseClickedEndScreen();
    break;
  case SCREEN_HIGHSCORES:
    mouseClickedHighScoresScreen();
    break;
  case SCREEN_WIN:
    mouseClickedWinScreen();
    break;
  case SCREEN_TUTORIAL:
    mouseClickedTutorialScreen();
    break;
  default:
    mouseClickedGameSetupScreen();
    break;
  }
}

void keyPressed() {
  switch(screen) {
  case SCREEN_GAME:
    keyPressedGameScreen();
    break;
  case SCREEN_TUTORIAL:
    keyPressedTutorialScreen();
    break;
  default:
    break;
  }
}
